class CreateSystemProperties < ActiveRecord::Migration
  def change
    create_table :system_properties do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end




end
