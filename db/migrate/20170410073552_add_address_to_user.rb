class AddAddressToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phone_address, :string
  end
end
