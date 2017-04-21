class AddStatusToTrader < ActiveRecord::Migration[5.0]
  def change
    add_column :traders, :status, :integer
  end
end
