class Admins::ItemsController < ApplicationController
	before_action :if_not_admin
	before_action :set_admin_item, only: [:show, :edit, :destroy, :new]

	def new
		@item = Item.new
		@genre = @item.genre
	end

	def index
		@items = Item.all
		@genre = @item.genre
	end

	def show
		@items = Item.all
		@item = Item.find(params[:id])
		@genre = @item.genre

	end

	def edit
		@item = Item.find(params[:id])
	end

	def create
		@item = Item.new(item_params)
		@genre = @item.genre
		if @item.save
			redirect_to admin_item_path(@item)
		else
			render :new
		end
	end

	def update
		@item = Item.find(params[:id])
		if @item.update(admin_item_params)
			redirect_to admin_item_path(@admin_item)
		else
			render :edit
		end
	end




	private
  	def if_not_admin
    	redirect_to root_path unless current_user.admin?
  	end

  	def set_admin_item
    	@item = Item.find(params[:id])
  	end

  	def admin_item_params
  		params.require(:item).permit(:name, :image, :introduction, :price, :genre_id, :is_active)
  	end
end
