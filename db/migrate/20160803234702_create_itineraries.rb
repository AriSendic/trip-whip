class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.integer :user_id
      t.string :venue_id
      t.string :food_id

      t.timestamps null: false
    end
  end
end
