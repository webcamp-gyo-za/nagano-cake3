class ItemsController < ApplicationController
  def index
  	@items = Item.all
  	@genre = Item.genre
  end

  def edit
  end

  def show
  end
end
