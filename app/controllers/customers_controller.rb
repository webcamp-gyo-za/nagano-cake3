class CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
    @customer = current_customer
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render 'edit'
    end
  end

  def withdrawal
  end

  def destroy
    current_customer.update(is_deleted: true, withdrawal_status: 1)
    @customer = Customer.find(params[:id])
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private
  def customer_params
  params.require(:customer).permit(:is_enabled, :last_name, :first_name, :last_kana, :first_kana,
                                  :phone_number, :email, :password, :post_number, :address)
  end

end
