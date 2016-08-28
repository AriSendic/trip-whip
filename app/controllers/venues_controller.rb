class VenuesController < ApplicationController
  def index
    city = params[:city]
    category = params[:category]
    @itinerary = Itinerary.find_by(id: params[:itinerary_id])
    @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_KEY'])
    @data = @client.spots_by_query("#{category} near #{city}")
  end
    
  
  def create
    @venue = Venue.new(
      api_id: params[:api_id],
      name: params[:name],
      lat: params[:lat],
      lng: params[:lng],
      address: params[:address],
      phone: params[:phone],
      itinerary_id: params[:itinerary_id]
    )
    if @venue.save
      redirect_to "/itineraries/#{@venue.itinerary_id}"
      puts "Saved Venue"
    else 
      render :show
    end 
  end  

  def show
    @venue_id = params[:venue_id]
    @itinerary = Itinerary.find_by(id: params[:itinerary_id])
    @data = Unirest.get("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{@venue_id}&key=#{ENV['GOOGLE_PLACES_KEY']}").body
  end  
end
