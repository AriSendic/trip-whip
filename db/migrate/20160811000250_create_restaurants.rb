class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :api_id
      t.string :name
      t.string :lat
      t.string :lng
      t.integer :itinerary_id
      t.integer :sort

      t.timestamps null: false
    end
  end
end
