class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit

  end

  def check
  end

  private

  def customer_params
    params.require(:customer).permit(:email)
  end



end
