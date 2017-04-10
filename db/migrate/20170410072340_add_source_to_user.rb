class AddSourceToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :source, :integer
  end
end
