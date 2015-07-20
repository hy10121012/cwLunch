class SystemProperty < ActiveRecord::Base

  def self.update_setB_menu(menu_str)
    item = self.where("name"=>"b_set_menu")
    item.value=menu_str
    item.save
  end

  def self.update_deliver_time(time)
    item = self.where("name"=>"lunch_time")
    item.value=time
    item.save
  end



end
