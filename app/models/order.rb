class Order < ActiveRecord::Base
  belongs_to :user


  def self.find_lunch_break_down(asof)
    self.select("orders.*,locations.name location_name,items.name_cn item_name,users.number number").where("order_date_time"=>asof).joins("left join locations on locations.id=orders.location_id left join items on items.id=orders.item_id left join users on users.id=orders.user_id")
  end

  def self.find_dinner_break_down(asof)
    self.select("orders.*,locations.name location_name,items.name_cn item_name,users.number number").where("order_date_time<"+asof.to_s)
        .joins("left join locations on locations.id=orders.location_id left join items on items.id=orders.item_id left join users on users.id=orders.user_id")
  end



end
