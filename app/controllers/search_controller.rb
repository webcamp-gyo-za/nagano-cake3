class SearchController < ApplicationController

	PER = 6

  def search
  	@genres = Genre.all
	@genre = Genre.find(params[:genre])
  	items = Item.all
  	@genre_items = @genre.items.page(params[:page]).per(PER)
  end
end
