class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    @order.customer_id = current_customer.id
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save!
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        order_detail = OrderDetail.new(order_id: @order.id)
        order_detail.price = cart_item.item.price
        order_detail.amount = cart_item.amount
        order_detail.item_id = cart_item.item_id
        order_detail.save!
      end
      @cart_items.destroy_all
      redirect_to orders_complete_path
    else
      render "new"
    end
  end

  def complete
    @order = Order.new
    @cart_items = current_customer.cart_items.all
  end

  def index
    @orders = current_customer.orders
  end

  def show
  end

  private
    def order_params
        params.require(:order).permit(:full_name, :postal_code, :adress, :name, :customer_id, :postage, :billing_amount, :payment_method)
    end

end
