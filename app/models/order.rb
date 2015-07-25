class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  belongs_to :location

  def self.find_lunch_break_down(asof)
    self.select("orders.*,locations.name location_name,items.name_cn item_name,users.number number").where("order_date_time"=>asof).joins("left join locations on locations.id=orders.location_id left join items on items.id=orders.item_id left join users on users.id=orders.user_id")
  end

  def self.find_dinner_break_down(asof)
    self.select("orders.*,locations.name location_name,items.name_cn item_name,users.number number").where("order_date_time<"+asof.to_s)
        .joins("left join locations on locations.id=orders.location_id left join items on items.id=orders.item_id left join users on users.id=orders.user_id")
  end

  def self.find_order_by_user user_id, offset
    self.where("user_id="+user_id)
        .joins("left join locations on locations.id=orders.location_id left join items on items.id=orders.item_id ").offset(offset).order("order_date_time")
  end

end
