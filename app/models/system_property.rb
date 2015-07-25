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

  def self.find_deliver_time()
    r = self.where("name"=>"lunch_time")
    if(r)
      r.first
    else
      ""
    end
  end

  def self.find_setB_menu()
    r = self.where("name"=>"b_set_menu")
    if(r)
      r.first
    else
      ""
    end
  end



end
