class CreateCommentPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :comment_photos do |t|
      t.integer :comment_id
      t.string :photo

      t.timestamps
    end
  end
end
