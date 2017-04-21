class AddTraderToActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :trader_id, :integer
  end
end
