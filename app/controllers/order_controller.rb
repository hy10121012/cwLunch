class OrderController < ApplicationController

  DATE_FORMAT = "%Y%m%d"

  def lunch
    hour = Time.new.hour

    day = Time.now.strftime(DATE_FORMAT);
    if (hour>12)
      day=day.to_s.to_f+1
    end

    results = Order.find_lunch_break_down(20150512)
    @orders={}
    for item in results
      puts item.item_name
      if (@orders[item.location_name].nil?)
        @orders[item.location_name]={}
      end
      name =item.item_name+item.order_type.to_s;
      if (@orders[item.location_name][name].nil?)
        @orders[item.location_name][name]=[]
      end

      @orders[item.location_name][name] << item
    end
    puts @orders.to_yaml
  end

  def dinner
  end

  def history
    results = Order.find_dinner_break_down(20150514)
    @orders={}
    for item in results

      if (@orders[item.order_date_time].nil?)
        @orders[item.order_date_time]={}
      end

      if (@orders[item.order_date_time][item.location_name].nil?)
        @orders[item.order_date_time][item.location_name]={}
      end
      name =item.item_name+item.order_type.to_s;
      if (@orders[item.order_date_time][item.location_name][name].nil?)
        @orders[item.order_date_time][item.location_name][name]=[]
      end

      @orders[item.order_date_time][item.location_name][name] << item
    end
  end

  def number_search
  end

  def new
    @order = Order.new
    @items = Item.all.select("name_cn", "id")
  end

  def create
    Order.new(order_params).save
    redirect_to controller: "order", action: "lunch"
  end


  private
  def order_params
    params.require(:order).permit(:item_id, :user_id, :order_date_time, :amount, :location_id, :order_type)
  end

end
