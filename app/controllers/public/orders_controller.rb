class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    @order.customer_id = current_customer.id
    @order.postage = 800
    @total_payment = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @order.billing_amount = @order.postage + @total_payment
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.full_name
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.full_name
    if @order.save
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        order_detail = OrderDetail.new(order_id: @order.id)
        order_detail.price = cart_item.item.price
        order_detail.amount = cart_item.amount
        order_detail.item_id = cart_item.item_id
        order_detail.save
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
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    @total_payment = @order.billing_amount - @order.postage
  end

  private
    def order_params
        params.require(:order).permit(:full_name, :postal_code, :adress, :name, :customer_id, :postage, :billing_amount, :payment_method)
    end

   def order_detail_params
        params.require(:order_detail).permit(:customer_id, :order_id, :amount, :price)
   end

end
