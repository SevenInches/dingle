class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :order_no
      t.float :deliver_price
      t.float :amount
      t.float :result
      t.float :discount
      t.string :trader_no
      t.integer :status
      t.date :pay_at
      t.string :time
      t.integer :pay_type

      t.timestamps
    end
  end
end
