class AddTraderToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :trader_id, :integer
  end
end
