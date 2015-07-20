class LunchController < ApplicationController
  def index
    @items = Item.find_all_lunch()


  end
end
