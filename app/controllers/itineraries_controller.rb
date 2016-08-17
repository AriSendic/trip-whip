class ItinerariesController < ApplicationController
  require 'yelp'
  require 'unirest'
  def index
    @itineraries = Itinerary.where("user_id=?", current_user.id).limit(3)
  end 
  
  def new
    
  end

  def create
    
  end

  def show
    @itinerary = Itinerary.find_by(id: params[:id])
  end

  def edit
    client = Yelp::Client.new(
      consumer_key: ENV['CONSUMER_KEY'],
      consumer_secret: ENV['CONSUMER_SECRET'],
      token: ENV['TOKEN'],
      token_secret: ENV['TOKEN_SECRET']
    )

    @data = client.search('Chicago', {
      category_filter: 'amusementparks,aquariums' 
     
      })
 # coordinates= {latitude: 41.8917756275199, longitude: -87.6070864272309} 
 #      @data = client.search('Chicago', coordinates, {
 #      category_filter: 'restaurants'
 #    })
 #    render json: @data
  end
  
  def update

  end  

end
