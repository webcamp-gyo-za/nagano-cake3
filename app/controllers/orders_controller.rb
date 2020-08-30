class Customers::OrdersController < ApplicationController

  before_action :authenticate_customer!
  # before_action :a, only: [:confirm]
  # before_action :b, only: [:confirm]
  def new
  	@order = Order.new
  	@order.customer_id = current_customer.id
  	#@user=currrent_user
    @delivery = current_customer.deliveries
    #redirect_to new_order_path(@order)
  end

  def confirm
    if params[:selected_post_number] == "1"
      @order = Order.new(address: current_customer.address, post_number: current_customer.post_number, customer: current_customer,payment_method: params[:order][:payment_method])
      #@order.post_number = current_customer.post_number
      #@order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:selected_post_number] == "2"
      # binding.pry
      if not params[:select].nil?
        delivery = Delivery.find(params[:select].to_i)
        @order = Order.new(address: delivery.address, post_number: delivery.post_number, customer: current_customer, payment_method: params[:order][:payment_method])
        @order.name = delivery.name
      end
      #binding.pry
    # else
    #   redirect_to order_new_path(@order)
    # end
    else
      if params[:order][:post_number].empty? || params[:order][:address].empty? || params[:order][:name].empty?
        redirect_to order_new_path
      else
    #byebug
        @order = Order.new(customer: current_customer,payment_method: params[:order][:payment_method], post_number: params[:order][:post_number], address: params[:order][:address], name: params[:order][:name])
      end
  	#@order.order_detail.new
    end
  	@cart_item = current_customer#要確認
    @cart_items = current_customer.cart_items

    #@cart_item = current_customer.cart_item

    @item_all_price = 0
    @cart_items.each do |cart_item|
      @item_all_price += cart_item.subtotal
    end

    #@shipping_cost = ShippingCost.find(params[:id])

    # @order.order_price = @item_all_price + 800
    #@order.save
    # p "___________________________________"
    # p @order.order_price
  end

  def create
  	@order = current_customer.orders.new(order_params)
    @delivery = current_customer.deliveries

  	 if @order.save
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new(order_id: @order.id, item_id: cart_item.item.id, number: cart_item.amount, price: cart_item.item.price)
      @order_detail.save
      end
  	   redirect_to order_thanks_path
      end
  	   #if @order.customer_id=current_customer.id
  	   #@user=currrent_user
  	   #render "new"
  	end
  

  def index
  	#@order = Order.where(customer_id: current_customer.id).order(created_at: :desc)
    @orders = current_customer.orders
  	#@item = @order.item
    #
    #
    #@ordernumber = 0
    #@cart_items.each do |cart_item|
    #@ordernumber+=@cart_item.amount
      #end
  end

  def show
  	@order = Order.find(params[:id])
    @order_detail = @order.order_details
     @cart_items = CartItem.all
  	#@cart_item = current_customer.cart_item

    #order= []  :中身のない配列order=Order.new に近いイメージ 初期化の１番の目的はnilから脱却すること
    #

  @order_price = 0
   @cart_items.each do |cart_item|
     @order_price +=cart_item.subtotal
     #@order_price=@order_price+cart_item.subtotal 小計
  end

  # @total_price = @order_price + 800
    @tax = 1.08

  #@shipping_cost.order_price = @order_price + 800 #請求

 end

  def thanks
    cart_items = current_customer.cart_items
    cart_items.destroy_all
  end

  private
  def order_params
    params.require(:order).permit(:subtotal, :number, :payment_method, :order_price, :post_number, :address, :name, :customer_id, :delivery_id)
  end

  def a
    if params[:selected_post_number] == "2" && current_customer.deliveries.count == 0
      redirect_to order_new_path
    end
  end
  def b
    if params[:selected_post_number] == "3" && current_customer.deliveries.count == 0
      redirect_to order_new_path
    end
  end


end
