class ItinerariesController < ApplicationController
  require 'yelp'
  require 'unirest'
  def index
    @itineraries = Itinerary.where("user_id=?", current_user.id).limit(3)
    # name your itin and start a new one
  end 
  
  def new
    city = params[:city]
    category = params[:category]
    @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_KEY'])
    @data = @client.spots_by_query("#{category} near #{city}")
  end

  
    
  

  def show
    @itinerary = Itinerary.find_by(id: params[:id])
  end

  def edit
    # @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_KEY'])
    # @data = @client.spot('<%=  %>')
    
    
    
  end
  
  def update

  end  

end
