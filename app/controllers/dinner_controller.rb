class DinnerController < ApplicationController
  def index
    @items = Item.find_all_dinner()

    @lunch_time  = SystemProperty


  end
end
