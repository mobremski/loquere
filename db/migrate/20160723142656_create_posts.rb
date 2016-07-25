class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :meetup_id, null: false
      t.string :body, null: false
      t.datetime :created_at
    end
  end
end
