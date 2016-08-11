class RemoveColumnsFromItinerary < ActiveRecord::Migration
  def change
    remove_column :itineraries, :venue_id, :string
    remove_column :itineraries, :food_id, :string
    add_column :itineraries, :title, :string
  end
end
