class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :venue_id
      t.text :text
      t.integer :time

      t.timestamps null: false
    end
  end
end
