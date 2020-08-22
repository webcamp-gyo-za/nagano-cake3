class ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
    # @cart_item = CartItem.new(product_id: @product.id)
  end

  private
  def item_params
		params.require(:item).permit(:name, :image_id, :introduction, :genre)
	end
end
