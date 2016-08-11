class Itinerary < ActiveRecord::Base
  belongs_to :user
  has_many :projects
  has_many :venues
  has_many :restauraunts
end
