class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  private

  def item_params
    params.require(:item).permit(
      :item_name, :detail, :category_id, :condition_id, 
      :delivery_charge_id, :address_id, :delivery_days_id, 
      :price, :image
      ).merge(user_id: current_user.id)
  end
end
