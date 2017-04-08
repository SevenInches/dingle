class CreateActivityOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :activity_orders do |t|
      t.integer :activity_id
      t.integer :order_id

      t.timestamps
    end
  end
end
