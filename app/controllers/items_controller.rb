class ItemsController < ApplicationController
  def new
    @item=Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
  end

  def update

    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item
  end

  def destory
  end

  def create
    @item=Item.new(item_params)
    @item.save
    if(@item.item_type==1)
      redirect_to :controller => "lunch", :action => "index"
    else
      redirect_to :controller => "dinner", :action => "index"
    end
  end

  def index
  end



  private
  def item_params
    params.require(:item).permit(:name_cn, :name_en, :price_a, :price_b, :item_type, :is_live, :img)
  end
end
