class DinnerController < ApplicationController
  def index
    @items = Item.find_all_dinner()
  end
end
