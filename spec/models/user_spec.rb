require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '9個の入力項目（nickname、email、password、password_confirmation、
      family_name、first_name、family_kana、first_kana、birthday）が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上かつ、半角英数字が混合なら登録できる' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      # ユーザー情報
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        # 生成した@userを保存してから別ユーザーを作る
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは@を含まないと登録できない' do
        @user.email = '111aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end
      it 'パスワードが空だと登録できない' do
        @user.password = ''
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", 'Password is invalid')
      end
      it 'パスワードは6文字より短いと登録できない' do
        @user.password = '123aa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは半角英数字混合でないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードは確認用を含めて2回入力しないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      # 本人情報
      it 'ユーザー本名が、名字が必須であること' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", 'Family name is invalid')
      end
      it 'ユーザー本名が、名前が必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
      end
      it '名字は全角（漢字・ひらがな・カタカナ）で入力させること' do
        @user.family_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it '名前は全角（漢字・ひらがな・カタカナ）で入力させること' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it '名字のフリガナが、名字が必須であること' do
        @user.family_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana can't be blank", 'Family kana is invalid')
      end
      it '名前のフリガナが、名前が必須であること' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank", 'First kana is invalid')
      end
      it '名字のフリガナは全角（カタカナ）で入力させること' do
        @user.family_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family kana is invalid')
      end
      it '名前のフリガナは全角（カタカナ）で入力させること' do
        @user.first_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana is invalid')
      end
      it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
