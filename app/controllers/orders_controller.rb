class OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new
  	@order = Order.new
  	@order.customer_id=current_customer.id
  	#@user=currrent_user
    @delivery = current_customer.deliveries
  end

  def confirm
    if params[:selected_post_number] == "1"
      @order = Order.new(address: current_customer.address, post_number: current_customer.post_number, customer: current_customer,payment_method: params[:order][:payment_method])
      #@order.post_number = current_customer.post_number
      #@order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:selected_post_number] == "2"

    else
  	@order = Order.new(customer: current_customer,payment_method: params[:order][:payment_method], post_number: params[:order][:post_number], address: params[:order][:address], name: params[:order][:name])
  	#@order.order_detail.new
  end
  	@cart_item = current_customer#要確認
    @cart_items = CartItem.all

    #@cart_item = current_customer.cart_item

  @item_all_price = 0
  @cart_items.each do |cart_item|
    @item_all_price += cart_item.subtotal
  end

  #@shipping_cost = ShippingCost.find(params[:id])

  @order.order_price = @item_all_price + 800
  @order.save
  p "___________________________________"
  p @order.order_price
 end

  def create
  	@order = current_customer.orders.new(order_params)
    @delivery = current_customer.deliveries



  	 if @order.save
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new(customer_id: current_customer.id, item_id: cart_item.id, amount: cart_item.amount, price: cart_item.item.price)
      @order_detail.save
      end
  	   redirect_to orders_success_path
      end



  	   if @order.customer_id=current_customer.id
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

  private
  def order_params
    params.require(:order).permit(:subtotal, :number, :payment_method, :order_price, :post_number, :address, :name, :customer_id, :delivery_id)
  end

end
