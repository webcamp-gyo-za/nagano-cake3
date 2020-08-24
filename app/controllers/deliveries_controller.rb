class DeliveriesController < ApplicationController
  def index
    @deliveries = Deliveries.new
  end

  def edit
    @deliveries = Deliveries.find(params[:id])
  end

  def create
    @deliveries = Deliveries.new(address_params)
    @deliveries.save
    redirect_to deliveries_path
  end

  def update
    @deliveries = Deliveries.find(params[:id])
    if @deliveries.update(deliveries_params)
      edirect_to deliveries_path
    else
      render :edit
    end
  end

  private
  def deliveries_params
    params.require(:deliveries).permit(:last_name,:first_name, :address, :last_kana, :first_kana, :post_number, :customer_id)
  end
end
