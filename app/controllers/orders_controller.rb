class OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new
  	@order = Order.new
  	@order.customer_id=current_customer.id
  	#@user=currrent_user
    @delivery = current_customer.deliveries
  end

  def confirm
  	@order = Order.new(customer: current_customer,payment_method: params[:order][:payment_method])
  	#@order.order_detail.new
  	@cart_item = current_customer#要確認
    @cart_items = CartItem.all

    #@cart_item = current_customer.cart_item

  @item_all_price = 0
  @cart_items.each do |cart_item|
    @item_all_price += cart_item.subtotal
  end

  #@shipping_cost = ShippingCost.find(params[:id])

  @order.order_price = @item_all_price + 800
  p "___________________________________"
  p @order.order_price
 end

  def create
  	@order = current_customer.order.new(order_params)
  	 @list.save
  	   redirect_to orders_success_path


  	   if @order.customer_id=current_user.id
  	   #@user=currrent_user
  	   render "new"
  	end
  end



  def index
  	@order = Order.where(customer_id: current_customer.id).order(created_at: :desc)
  	@item = @order.item
    #
    #
    #@ordernumber = 0
    #@cart_items.each do |cart_item|
    #@ordernumber+=@cart_item.amount
      #end
  end

  def show
  	@order = Order.find(params[:id])
  	@cart_item = current_customer.cart_item

    #order= []  :中身のない配列order=Order.new に近いイメージ 初期化の１番の目的はnilから脱却すること
    #

  @order_price = 0
   @cart_items.each do |cart_item|
     @order_price +=cart_item.subtotal
     #@order_price=@order_price+cart_item.subtotal 小計
  end

  @shipping_cost.order_price = @order_price + 800 #請求
 end



  def thanks
  end

  def order_paramas
    params.require(:order).permit(:payment_method, :post_number, :adress, :name)
  end

end
