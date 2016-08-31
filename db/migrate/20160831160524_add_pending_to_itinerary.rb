class AddPendingToItinerary < ActiveRecord::Migration
  def change
    add_column :itineraries, :pending, :boolean, default: true
  end
end
