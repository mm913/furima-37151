class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_order, only:[:index, :create]
  before_action :move_to_index, only: :index

  def index
    @order_delivery = OrderDelivery.new
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      pay_item
      @order_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_delivery).permit(:post_code, :address_id, :municipalities, :house_number, 
      :building, :tel, :order_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def move_to_index 
    if user_signed_in? && current_user.id == @item.user.id
      redirect_to root_path
    elsif @item.order.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
