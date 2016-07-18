class AddUserIdColumnToMeetups < ActiveRecord::Migration
  def change
    add_column :meetups, :user_id, :integer, null: false
  end
end
