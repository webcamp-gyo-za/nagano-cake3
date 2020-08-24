class ItemsController < ApplicationController
  def index
  	@items = Item.all
    @genres = Genre.all
  end

  def show
  	@item = Item.find(params[:id])
    @cart_item = CartItem.new(item_id: @item.id)
  end

  def home
    @genres = Genre.all
    @items = Item.all
  end

  private
  def item_params
		params.require(:item).permit(:name, :image_id, :introduction, :genre)
	end
end
