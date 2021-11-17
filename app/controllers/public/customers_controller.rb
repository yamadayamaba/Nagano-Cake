class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update
    redirect_to about_path
  end

  def leave
    @customer = Customer.find(params[:id])
  end

  def resign
    @customer = Customer.find(params[:id])
    @customer.update
    reset_session
    redirect_to new_customer_registration_path
  end

  private


  def customer_params
    params.require(:customer).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :address, :telephone_number, :postal_code)
  end

end
