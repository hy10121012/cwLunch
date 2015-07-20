class LocationsController < ApplicationController
  def index
    @addresses = Location.all.order("name")

  end

  def create
    @location = Location.new
    @location.update(params.require(:location).permit(:name))
    redirect_to :action => "index"
  end

  def new
    @location = Location.new
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    @location.update(params.require(:location).permit(:name))
    redirect_to :action => "index"
  end


  def show
  end
end
