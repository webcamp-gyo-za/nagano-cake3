class Admins::GenresController < ApplicationController
	before_action :if_not_admin

	def index
		@genres = Genre.all
		@genre = Genre.new
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		@genre = Genre.find(params[:id])
		if @genre.update(genre_params)
			redirect_to genres_path(@admin_item)
		else
			render :edit
	end
	end

	def create
		@genre = Genre.new(genre_params)
		@genres = Genre.all
		if @genre.save
			redirect_to genres_path(@genre)
		else
			render :index
	end

	private
  	def if_not_admin
    	redirect_to root_path unless current_user.admin?
  	end


  	def genre_params
  		params.require(:item).permit(:name, :is_active)
	end
end
