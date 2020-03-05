class CreateRSVPs < ActiveRecord::Migration[5.0]
  def change
    create_table :rsvps do |t|
      t.integer :user_id
      t.integer :hotel_id
      t.datetime :start_date
      t.datetime :departure_date
      t.integer :budget
      t.integer :num_rooms
      t.boolean :breakfast
      t.boolean :pool
      t.boolean :gym
    end
  end
end