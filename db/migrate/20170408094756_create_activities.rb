class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :type
      t.datetime :start_time
      t.datetime :end_time
      t.integer :status

      t.timestamps
    end
  end
end
