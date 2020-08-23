class OrdersController < ApplicationController

  #before_action :authenticate_customer!

  def new
  	@order=Order.new
  	@order.customer_id=current_customer.id
  	#@user=currrent_user
  end

  def confirm
  	@order=Order.new(order_params)
  	@order.order_detail.new
  	@cart_item=current_customer.cart_item #要確認

    @cart_item=current_customer.cart_item

  @order_price　= 0
  @cart_items.each do |f|
    @order_price +=f.subtotal
  end

  @shipping_cost.order_price = @order_price + 800
 end

  def create
  	@order=Order.new(order_params)
  	if @list.save
  	   redirect_to orders_success_path
  	else
  	   @order.customer_id=current_user.id
  	   #@user=currrent_user
  	   render "new"
  	end
  end

  

  def index
  	@order=Order.where(customer_id :current_customer.id).order(created_at: :desc)
  	@item=@order.item
  end

  def show
  	@order=Order.find(params[:id])
  	@cart_item=current_customer.cart_item

  @order_price　= 0
  @cart_items.each do |f|
     @order_price +=f.subtotal
  end

  @shipping_cost.order_price = @order_price + 800
 end

  

  def thanks
  end

end
