class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :name
      t.integer :gender
      t.string :phonecall
      t.string :address
      t.integer :tag

      t.timestamps
    end
  end
end
