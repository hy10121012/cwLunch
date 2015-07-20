class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name_cn
      t.string :name_en
      t.integer :period
      t.boolean :item_type
      t.float :price_a
      t.float :price_b
      t.integer :period
      t.integer :is_live
      t.timestamps
    end
  end
end
