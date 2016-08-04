class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :user_id
      t.string :venue_id
      t.text :text
      t.integer :time

      t.timestamps null: false
    end
  end
end
