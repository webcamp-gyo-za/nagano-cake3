class DeliveriesController < ApplicationController
  def edit
  end

  def index
    @deliveries = Deliveries.new
  end
end
