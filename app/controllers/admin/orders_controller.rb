class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total_payment = @order.billing_amount - @order.postage
  end


end
