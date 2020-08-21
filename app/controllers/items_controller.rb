class ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def show
  	@items = Item.find(params[:id])
  end

  private
  def item_params
		params.require(:item).permit(:name, :image_id, :introduction)
	end
end
