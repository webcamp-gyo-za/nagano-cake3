class DeliveriesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @customer = current_customer
    @delivery = Delivery.new
    @deliveries = @customer.deliveries
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    @delivery.save
    redirect_to deliveries_path(current_customer)
  end

  def edit
    @delivery = Delivery.find(params[:id])
    if current_customer.id != @delivery.customer_id
      redirect_to delivery_path
    end
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      redirect_to deliveries_path
    else
      render :edit
    end
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to deliveries_path
  end

  private
  def delivery_params
    params.require(:delivery).permit(:name, :post_number, :address, :customer_id)
  end

end
