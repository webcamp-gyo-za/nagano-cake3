class Admins::OrdersController < ApplicationController

	def index
	  @orders=Order.all(created_at: :desc)
	  @order_detail=@order.order_detail
	end

	def show
		@order=Order.find(params[:id])
		@order_detail=@order.order_detail
	end

	def update
		@order=Order.find(params[:id])
		if @order.update(order_params)
			redirect_to x_path
		else
		   render "show"
		   @order_detail=@order.order_detail
		end

    end

    private
    def order_params
      params.require(:order).permit(:status)
    end
end
