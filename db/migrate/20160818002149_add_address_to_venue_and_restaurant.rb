class AddAddressToVenueAndRestaurant < ActiveRecord::Migration
  def change
    add_column :venues, :address, :string
    add_column :restaurants, :address, :string
  end
end