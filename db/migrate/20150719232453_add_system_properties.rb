class AddSystemProperties < ActiveRecord::Migration
  def change
  end

  SystemProperty.create :name=>"b_set_menu", :value=>"小草肉+西红柿"
  SystemProperty.create :name=>"lunch_time", :value=>"12:40"

end
