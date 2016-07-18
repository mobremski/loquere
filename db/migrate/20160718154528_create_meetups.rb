class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.string :name, null: false
      t.string :location_name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.string :date, null: false
      t.string :time, null: false
      t.string :language, null: false
      t.string :description, null: false
    end
  end
end
