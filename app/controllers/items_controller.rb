class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
    @item = Item.new
  end

  private
  
  def item_params
    params.require(:item).permit(:image, :item_name, :item:info, :item_price, :deli_fee_id, :shipping_area_id, :shipping_day_id, :condition_id, :category_id).merge(user_id: current_user.id)
  end
end
