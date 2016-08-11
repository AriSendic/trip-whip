class Venue < ActiveRecord::Base
  belongs_to :itinerary
  has_many :posts
end
