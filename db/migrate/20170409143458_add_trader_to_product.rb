class AddTraderToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :trader_id, :integer
  end
end
