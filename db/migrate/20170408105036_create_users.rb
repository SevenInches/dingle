class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :phone
      t.string :avatar
      t.string :password
      t.float :money

      t.timestamps
    end
  end
end
