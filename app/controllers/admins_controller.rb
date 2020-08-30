class AdminsController < ApplicationController
	def top
		@order = Order.all
	end
end
