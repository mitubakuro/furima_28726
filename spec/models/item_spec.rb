require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能の単体テスト' do
    context '出品がうまくいくとき' do
      it '9個の入力項目（item_name、item_text、item_price、
      deli_fee、condition、category、shipping_day、shipping_area、user_id）が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかない時' do
      it 'item_nameが空だと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_textが空だと登録できない' do
        @item.item_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item text can't be blank")
      end
      it 'categoryが空だと登録できない' do
        @item.category = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーが--だと登録できない' do
        @item.category = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category （カテゴリー）を選んでください")
      end
      it 'conditionが空だと登録できない' do
        @item.condition = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '商品の状態が--だと登録できない' do
        @item.condition = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition （商品の状態）を選んでください")
      end
      it '配送料が空だと登録できない' do
        @item.deli_fee = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Deli fee can't be blank")
      end
      it '配送料が--だと登録できない' do
        @item.deli_fee = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deli fee （配送料）を選んでください")
      end
      it '配送元の地域が空だと登録できない' do
        @item.shipping_area = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '配送元の地域が--だと登録できない' do
        @item.shipping_area = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area （配送元の地域）を選んでください")
      end
      it '配送までの日数が空だと登録できない' do
        @item.shipping_day = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it '配送までの日数が--だと登録できない' do
        @item.shipping_day = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day （発送までの日数）を選んでください")
      end
      it 'item_priceが空だと登録できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank", 'Item price is not a number')
      end
      it 'item_priceが300より小さいと登録できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than 299')
      end
      it 'item_priceが9999999より大きいと登録できない' do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than 10000000')
      end
    end
  end
end
