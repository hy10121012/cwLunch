class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :item_id
      t.integer :user_id
      t.timestamp :order_date_time
      t.integer :amount
      t.integer :location_id
      t.integer :order_type
      t.integer :period

      t.timestamps
    end
  end
end
