class Order < ActiveRecord::Base



  def self.find_lunch_break_down(asof)
    self.where("order_date_time"=>asof)
  end




end
