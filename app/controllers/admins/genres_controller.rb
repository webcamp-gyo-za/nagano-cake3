class Admins::GenresController < ApplicationController
	before_action :authenticate_admin!, only: [:edit, :create, :update,]

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
			redirect_to admins_genres_path(@genre)
		else
			render :edit
		end
	end

	def create
		@genre = Genre.new(genre_params)
		@genres = Genre.all
		if @genre.save
			redirect_to admins_genres_path(@genre)
		else
			render :index
		end
	end

	private
  	def genre_params
  		params.require(:genre).permit(:name, :is_active)
	end
end
