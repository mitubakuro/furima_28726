class ItemsController < ApplicationController
  # before_action :move_to_login, except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
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

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :item_name, :item_text, :item_price, :deli_fee_id, :shipping_area_id, :shipping_day_id, :condition_id, :category_id
    ).merge(user_id: current_user.id)
  end

  # def move_to_login
  #   redirect_to new_user_session_path unless user_signed_in?
  # end

  def set_item
    @item = Item.find(params[:id])
  end
end
