class Itinerary < ActiveRecord::Base
  belongs_to :user
  has_many :venues
  has_many :restaurants
 
  def friendly_time
    created_at.strftime('%A, %b %d')
  end
end

