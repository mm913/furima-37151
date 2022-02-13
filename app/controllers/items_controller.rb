class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit]
  
  def index
    @items = Item.all.order(created_at: :desc)
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

  def show
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(
      :item_name, :detail, :category_id, :condition_id,
      :delivery_charge_id, :address_id, :delivery_days_id,
      :price, :image
      ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
