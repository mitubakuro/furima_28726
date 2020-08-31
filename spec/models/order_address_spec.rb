require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    it 'tokenが空欄だと保存できない' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空欄だと保存できない' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
    end
    it 'postal_codeにハイフンが含まれないと保存できない' do
      @order_address.postal_code = "1234567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end
    it 'shipping_area_idが空欄だと保存できない' do
      @order_address.shipping_area_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Shipping area can't be blank")
    end
    it 'cityが空欄だと保存できない' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it 'addressesが空欄だと保存できない' do
      @order_address.addresses = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
    end
    it 'telが空欄だと保存できない' do
      @order_address.tel = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Tel can't be blank")
    end
    it 'telが11桁以上だと保存できない' do
      @order_address.tel = "123456789000"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Tel is invalid")
    end
  end
end
