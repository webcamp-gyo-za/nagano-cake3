class Admins::OrderDetailsController < ApplicationController
	def update
		@order_detail = OrderDetail.find(params[:order_id])
		@order_detail.update(order_detail_params)
		redirect_to admins_orders_path(@order_detail)
		# render "admins/orders/index"
	end

	private
	def order_detail_params
	 params.require(:order_detail).permit(:status, :order_id)
	end
end
