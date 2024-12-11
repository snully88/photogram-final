class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.integer :fan_id
      t.integer :photo_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
