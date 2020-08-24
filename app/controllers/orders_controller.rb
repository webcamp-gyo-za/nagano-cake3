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
    #
    #
    #@ordernumber = 0
    #@cart_items.each do |cart_item|
    #@ordernumber+=@cart_item.amount
      #end
  end

  def show
  	@order=Order.find(params[:id])
  	@cart_item=current_customer.cart_item

    #order= []  :中身のない配列　order=Order.new に近いイメージ 初期化の１番の目的はnilから脱却すること
    #

  @order_price　= 0
  　@cart_items.each do |cart_item|
     @order_price +=cart_item.subtotal
     #@order_price=@order_price+cart_item.subtotal 小計
  end

  @shipping_cost.order_price = @order_price + 800 #請求
 end

  

  def thanks
  end

end
