class ChangePostTimeToDecimal < ActiveRecord::Migration
  def change
    change_column :posts, :time, :decimal, precision: 5, scale: 1 
  end
end
