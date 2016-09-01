class ItinerariesController < ApplicationController
  require 'yelp'
  require 'unirest'
  def index
    @itineraries = Itinerary.last(3).reverse
  end 
  
  def new
    
  end

  def create
    @itinerary = Itinerary.new(
      title: params[:title],
      user_id: current_user.id
    )
    @itinerary.save
    redirect_to "/itineraries/#{@itinerary.id}"
  end
    
  

  def show
    @itinerary = Itinerary.find_by(id: params[:id])
  end

  def edit
   
    
    
    
  end
  
  def update
   
  end  
  # def complete
  #   @itinerary = Itinerary.find_by(id: params[:id])
  #   @itineray.pending = false
  # end  
end
