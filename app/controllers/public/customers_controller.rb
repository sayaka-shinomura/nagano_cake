class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update (customer_params)
    redirect_to customers_mypage_path(current_customer.id)
  end

  def check
  end

  private

  def customer_params
    params.require(:customer).permit(:address)
  end



end
