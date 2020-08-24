class SearchController < ApplicationController
  def search
  	@genres = Genre.all
	@genre = Genre.find(params[:genre])
  	items = Item.all
  	@genre_items = @genre.items
  end
end
