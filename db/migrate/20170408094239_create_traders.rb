class CreateTraders < ActiveRecord::Migration[5.0]
  def change
    create_table :traders do |t|
      t.string :title
      t.string :logo
      t.boolean :is_brand
      t.string :branch
      t.text :description
      t.integer :deliver_id

      t.timestamps
    end
  end
end
