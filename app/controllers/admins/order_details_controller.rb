class Admins::OrderDetailsController < ApplicationController
	def update
		@order = Order.find(params[:id])
		@order.order_details.update(order_detail_params)
		redirect_to admins_order_path
	end

	private
	def order_detail_params
	 params.require(:order_detail).permit(:status, :order_id)
	end
end
