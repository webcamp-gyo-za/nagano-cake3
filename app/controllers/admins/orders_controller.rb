class Admins::OrdersController < ApplicationController

	def index
		@orders = Order.all.order(created_at: :desc)
	end

	def show
		@order = Order.find(params[:id])
		@order_details = @order.order_details
	end

	def update
		@order = Order.find(params[:id])
		if @order.update(order_params)
			redirect_to admins_orders_path
		else
		   render "show"
		end
 	end

    private
    def order_params
      params.require(:order).permit(:status)
    end
end
