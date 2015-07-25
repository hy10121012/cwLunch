class LunchController < ApplicationController
  def index
    @items = Item.find_all_lunch()
    @setB_menu = SystemProperty.find_setB_menu
    @lunch_time = SystemProperty.find_deliver_time
  end

  def update_setB_menu
    setB_menu = SystemProperty.find_setB_menu
    setB_menu.value=params[:system_property][:value]
    setB_menu.save
    redirect_to :action=>"index"
  end

  def get_lunch_in_jason

  end


end
