class RemoveProductFromCate < ActiveRecord::Migration[5.0]
  def change
    remove_column :cates, :product_id, :integer
  end
end
