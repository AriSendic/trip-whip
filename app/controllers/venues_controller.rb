class VenuesController < ApplicationController
  def index
    city = params[:city]
    category = params[:category]
    @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_KEY'])
    @data = @client.spots_by_query("#{category} near #{city}")
  end
     
  def new
        @venue_id = params[:venue_id]
        @data = Unirest.get("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{@venue_id}&key=#{ENV['GOOGLE_PLACES_KEY']}").body
        
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
    @venue.save
    redirect_to "/itinerary/#{@venue.itinerary_id}" 
  end  

  def show
    @venue_id = params[:venue_id]
        @data = Unirest.get("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{@venue_id}&key=#{ENV['GOOGLE_PLACES_KEY']}").body
  end  
end
