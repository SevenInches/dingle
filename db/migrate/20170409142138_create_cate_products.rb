class CreateCateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :cate_products do |t|
      t.integer :cate_id
      t.integer :product_id

      t.timestamps
    end
  end
end
