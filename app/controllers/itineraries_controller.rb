class ItinerariesController < ApplicationController
  require 'yelp'
  require 'unirest'
  def index
    @itineraries = Itinerary.where(user_id: current_user.id)
  end 
  
  def new
    
  end

  def create
    @itinerary = Itinerary.new(
      title: params[:title],
      user_id: current_user.id
    )
    @itinerary.save
    redirect_to "/itineraries/#{@itinerary.id}/edit"
  end
    
  

  def show
    @itinerary = Itinerary.find_by(id: params[:id])
    @times = [0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6]
    parts = @itinerary.venues.first.address.split(' ')
    @city = parts[-4]
    @state = parts[-3]
    @data = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22#{@city}%2C%20#{@state}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body
  end

  def edit
    @itinerary = Itinerary.find_by(id: params[:id])
    
    
    
  end
  
  def update
    @itinerary = Itinerary.find_by(id: params[:id])
    @itinerary.pending = false
    @itinerary.save
    redirect_to "/itineraries/#{@itinerary.id}"
  end
  
  def destroy  
    @itinerary = Itinerary.find_by(id: params[:id])
    @itinerary.pending = true
    @itinerary.save
    redirect_to "/itineraries/#{@itinerary.id}/edit"
  end
end
