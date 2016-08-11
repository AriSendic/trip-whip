class AddColumnsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :itinerary_id, :integer
    add_column :projects, :sort, :integer
  end
end
