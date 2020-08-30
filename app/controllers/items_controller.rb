class ItemsController < ApplicationController

    PER = 6

  def index
  	@items = Item.page(params[:page]).per(PER)
    @genres = Genre.all
  end

  def show
  	@item = Item.find(params[:id])
    @cart_item = CartItem.new(item_id: @item.id)
    @genres = Genre.all
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
