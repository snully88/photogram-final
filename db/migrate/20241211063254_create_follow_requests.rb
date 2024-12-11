class CreateFollowRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :follow_requests do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.string :status
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
