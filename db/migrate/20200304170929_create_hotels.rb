class CreateHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :hotels do |t|
      t.string :website
      t.string :phone
      t.string :zip
      t.string :address
      t.integer :num_rooms
      t.string :name
      t.boolean :gym
      t.boolean :pool 
      t.boolean :breakfast
      t.integer :budget
    end
  end
end
