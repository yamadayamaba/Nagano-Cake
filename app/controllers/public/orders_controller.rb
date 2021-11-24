class Public::OrdersController < ApplicationController
  def new
    @order.new
  end

  def create
    order.new(params[:id])
    order.save
    render :cheak
  end

  def confirm
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
  end

  def cheak
    @order = Order.find(params[:id])
    @cart_item = CartItem.find(params[:id])
  end

  def complete
  end

  def index
    @order = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :cart_item_id)
  end

end
