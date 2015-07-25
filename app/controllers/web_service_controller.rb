class WebServiceController < ApplicationController
  layout "blank"
  skip_before_filter :authorize,:verify_authenticity_token


  def get_lunch
    @items = Item.find_live_lunch
    render json: @items
  end

  def get_dinner
    @items = Item.find_live_dinner
    render json: @items
  end


  def get_history_order
    orders = Order.find_order_by_user(params[:user_id], params[:offiset])


    render json: orders.to_json(include: [:location, :item]);
  end


  def create_order
    order_param=get_order_params
    order_param[:location_id] = Location.find_by_name(get_order_params[:location])
    order_param.delete("location")
    order = Order.new(order_param)
    order.save

    respond = ["result"=>"Success"]
    render json: respond
  end

  def cancel_order
  end

  def update_order
  end

  def register
  end

  def login
  end


  private
  def get_order_params
    params.require(:order).permit(:user_id, :item_id, :amount, :order_type, :location)
  end
end
