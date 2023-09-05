class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
  end

  def complete
    @order = Order.new
    @cart_items = current_customer.cart_items.all
  end

  def index
  end

  def show
  end

  private
    def order_params
        params.require(:order).permit(:full_name, :postal_code, :adress)
    end

end
