class AddImgToItem < ActiveRecord::Migration
  def change
    add_attachment :items, :img
  end
end
