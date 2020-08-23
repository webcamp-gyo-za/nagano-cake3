class CartItemsController < ApplicationController
	before_action :authenticate_customer!
	before_action :into_cart_item, only: [:show, :update, :edit, :destroy]
	before_action :login_customer
  def index
  end

  private

  def login_customer
  	@customer = current_costomer
  end

  def into_cart_item
  	@cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
  	params.require(:cart_item).permit(:customer_id, :amount, :item_id)

end
