class Admins::OrderDetailsController < ApplicationController
	def update
		@order_detail=OrderDetail.find(params[:id])
		if @order_detail.update(order_detail_params)
			redirect_to X_path
		else
			render "show"
		end

	end

	private
	def order_detail_params
	　params.require(:order_detail).permit(:status)
	end
end
