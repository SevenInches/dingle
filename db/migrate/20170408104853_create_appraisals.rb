class CreateAppraisals < ActiveRecord::Migration[5.0]
  def change
    create_table :appraisals do |t|
      t.integer :order_id
      t.integer :score
      t.boolean :status

      t.timestamps
    end
  end
end
