class OrderController < ApplicationController

  DATE_FORMAT = "%Y%m%d"

  def lunch
    hour = Time.new.hour

    day = Time.now.strftime(DATE_FORMAT);
    if(hour>12)
      day=day.to_s.to_f+1
    end


    @orders = Order.find_lunch_break_down(day)

  end

  def dinner
  end

  def history
  end

  def number_search
  end

  def new

  end
end
