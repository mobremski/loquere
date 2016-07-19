class AddLocationLanguageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string, null: false
    add_column :users, :language, :string, null: false
  end
end
