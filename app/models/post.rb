class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue

   
  def friendly_time
    created_at.strftime('%A, %b %d')
  end
end