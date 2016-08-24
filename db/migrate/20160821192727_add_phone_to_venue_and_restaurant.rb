class AddPhoneToVenueAndRestaurant < ActiveRecord::Migration
  def change
    add_column :venues, :phone, :string    
    add_column :restaurants, :phone, :string
  end
end
