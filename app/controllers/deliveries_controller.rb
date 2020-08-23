class DeliveriesController < ApplicationController
  def edit
    @deliveries = Deliveries.find(params[:id])
  end

  def index
    @deliveries = Deliveries.new

  end
end
