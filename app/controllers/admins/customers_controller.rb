class Admins::CustomersController < ApplicationController
	before_action :authenticate_admin!

	PER = 8

	def index
		@customers = Customer.page(params[:page]).per(PER)
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		@customer = Customer.find(params[:id])
    	if @customer.update(customer_params)
      		redirect_to customer_path(@customer)
   		else
      		render 'edit'
    	end
	end
end
