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
    redirect_to "/itineraries/#{@itinerary.id}/edit"
  end
    
  

  def show
    @itinerary = Itinerary.find_by(id: params[:id])
    @times = [0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6]

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
