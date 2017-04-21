class AddTimeToTrader < ActiveRecord::Migration[5.0]
  def change
    add_column :traders, :open_time, :time
    add_column :traders, :close_time, :time
  end
end
