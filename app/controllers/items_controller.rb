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

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:image, :item_name, :item_text, :item_price, :deli_fee, :shipping_area, :shipping_day, :condition, :category).merge(user_id: current_user.id)
  end
end
