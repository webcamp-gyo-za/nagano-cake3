class CartItemsController < ApplicationController
	before_action :authenticate_customer!
	before_action :into_cart_item, only: [:show, :update, :edit, :destroy]
	before_action :login_customer

  def create
    @cart_item = current_customer.cart_items.build(cart_item_params)
    @current_item = CartItem.find_by(item_id: @cart_item.item_id, customer_id: @cart_item.customer_id)
    # カートに同じ商品がなければ新規追加、あれば既存のデータと合算
    @carts_items = current_customer.cart_items.all
    if @current_item.nil?
      if @cart_item.save
        flash[:success] = 'カートに商品が追加されました！'
      redirect_to cart_items_path
      else
          @item = Item.find(params[:cart_item][:item_id])
          @cart_item = CartItem.new(item_id: @item.id)
      render "items/show"
      end
    else
        @current_item.amount += params[:cart_item][:amount].to_i
        @current_item.save
        redirect_to cart_items_path
      end
  end

  def index
    @cart_items = @customer.cart_items.all
    @sum_all = 0
  end


  def destroy
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def update
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
      flash[:success] = 'カート内の商品を更新しました！'
    end
  end

  def destroy_all
    @customer.cart_items.destroy_all
    redirect_to cart_items_path
  end


  private

  def login_customer
  	@customer = current_customer
  end

  def into_cart_item
  	@cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
  	params.require(:cart_item).permit(:customer_id, :amount, :item_id)
  end

end
