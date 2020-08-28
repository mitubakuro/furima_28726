class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]


  def index
  end

  def create
    @order = OrderAddress.new(item_id: @item.id, user_id: current_user.id)
    binding.pry
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:token, :postal_code, :shipping_area_id, :city, :addresses, :build_number, :tel)
    # 住所情報はpayjpの動作確認後、Formオブジェクトと一緒に記載する
  end

  def pay_item
    Payjp.api_key = "sk_test_edb5ad715db112611e06259d"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.item_price ,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
 

end
