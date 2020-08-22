require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
    end
    it "emailが空では登録できない" do
    end
    it "ニックネームが必須であること" do
    end
    it "メールアドレスが必須であること" do
    end
    it "メールアドレスが一意性であること" do
    end
    it "メールアドレスは@を含む必要があること" do
    end
    it "パスワードが必須であること" do
    end
    it "パスワードは6文字以上であること" do
    end
    it "パスワードは半角英数字混合であること" do
    end
    it "パスワードは確認用を含めて2回入力すること" do
    end
  end

end
