class CreateTraderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :trader_details do |t|
      t.integer :trader_id
      t.integer :start
      t.float :deliver_price
      t.integer :deliver_time
      t.float :evaluation

      t.timestamps
    end
  end
end
