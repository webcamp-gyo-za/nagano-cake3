class Admins::ItemsController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_admin_item, only: [:show, :edit, :update]

	PER = 10

	def new
		@item = Item.new
		@genre = @item.genre
	end

	def index
		@items = Item.page(params[:page]).per(PER)
	end

	def show
	end

	def edit
	end

	def create
		@item = Item.new(admin_item_params)
		if @item.save
			redirect_to admins_item_path(@item)
		else
			render :new
		end
	end

	def update
		if @item.update(admin_item_params)
			redirect_to admins_item_path(@item)
		else
			render :edit
		end
	end


	private
  	def set_admin_item
    	@item = Item.find(params[:id])
  	end

  	def admin_item_params
  		params.require(:item).permit(:name, :image, :introduction, :price, :genre_id, :is_active)
  	end
end
