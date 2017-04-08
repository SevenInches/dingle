class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.float :price
      t.float :discount
      t.text :info
      t.float :evaluation
      t.integer :number

      t.timestamps
    end
  end
end
