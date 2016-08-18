class ChangeColumnInItineraries < ActiveRecord::Migration
  def change
    rename_column :posts, :venue_id, :api_id
  end
end
