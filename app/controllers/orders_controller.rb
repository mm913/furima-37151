class OrdersController < ApplicationController
  before_action :set_order, only:[:index, :create]

  def index
    @order_delivery = OrderDelivery.new
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      @order_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_delivery).permit(:post_code, :address_id, :municipalities, :house_number, 
      :building, :tel, :order_id).merge(user_id: current_user.id, item_id: @item.id)
  end

  def set_order
    @item = Item.find(params[:item_id])
  end
end
