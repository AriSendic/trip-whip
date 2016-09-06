class VenuesController < ApplicationController
  def index
    lat = params[:lat]
    lng = params[:lng]
    city = params[:city]
    category = params[:category]
    @itinerary = Itinerary.find_by(id: params[:itinerary_id])
    # @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_KEY'])
    # @data = @client.spots_by_query("#{category} near #{city}")
    if params[:city].present?
      @data = Unirest.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{category}+in+#{city}&key=#{ENV['GOOGLE_PLACES_KEY']}").body  
    else
      @data = Unirest.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{category}&key=#{ENV['GOOGLE_PLACES_KEY']}&location=#{lat},#{lng}&rankby=distance").body
    end    
    
  
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
      redirect_to "/itineraries/#{@venue.itinerary_id}/edit"
    else 
      render :show
    end 
  end  

  def show
    @venue_id = params[:venue_id]
    @posts = Post.where(api_id: @venue_id) 
    @itinerary = Itinerary.find_by(id: params[:itinerary_id])
    @data = Unirest.get("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{@venue_id}&key=#{ENV['GOOGLE_PLACES_KEY']}").body
   
  end

  def destroy
    @venue = Venue.find_by(id: params[:venue_id])
    @venue.destroy

    redirect_to "/itineraries/#{params[:itinerary_id]}/edit"
  end  
end
