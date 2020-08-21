class Admins::GenresController < ApplicationController
	# before_action :authenticate_admin!

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
			redirect_to genre_path
		else
			render :index
		end
	end

	private
  	def genre_params
  		params.require(:item).permit(:name, :is_active)
	end
end
