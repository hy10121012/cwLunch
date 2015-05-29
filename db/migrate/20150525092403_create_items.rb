class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name_cn
      t.string :name_en
      t.integer :type
      t.float :price_a
      t.float :price_b
      t.string :img_url

      t.timestamps
    end
  end
end
