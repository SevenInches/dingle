class CreateCates < ActiveRecord::Migration[5.0]
  def change
    create_table :cates do |t|
      t.string :name
      t.integer :type
      t.integer :product_id

      t.timestamps
    end
  end
end
