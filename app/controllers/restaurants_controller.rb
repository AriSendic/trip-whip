class RestaurantsController < ApplicationController
  def index
    lat = params[:lat]
    lng = params[:lng]
    type = params[:type]
    @itinerary = Itinerary.find_by(id: params[:itinerary_id])
    # @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_KEY'])
    # @data = @client.spots_by_query(type.to_s, :types => 'restaurant', :exclude => ['night_club', 'bar'], :location => {lat}, #{lng}", :radius => "10000")
    # render json: @data
    @data = Unirest.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{type}&key=#{ENV['GOOGLE_PLACES_KEY']}&location=#{lat},#{lng}&rankby=distance&type=restaurant").body
    # render json: @data 
  end

  def show
    @restaurant_id = params[:restaurant_id]
    @itinerary = Itinerary.find_by(id: params[:itinerary_id])
    @data = Unirest.get("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{@restaurant_id}&key=#{ENV['GOOGLE_PLACES_KEY']}").body
    @restaurants = Restaurant.where(api_id: params[:restaurant_id])
    if @restaurants.count > 0
      @venues = []
      @itineraries = []
      @restaurants.each do |restaurant|
        @itineraries << restaurant.itinerary
      end  
      @itineraries.each do |itinerary|
        itinerary.venues.each do |venue|
          @venues << venue.name
        end
      end    
      @venues.uniq!
      @venues = @venues.join(" or ")      
    end  

    if @itinerary.venues.count == 3
      if @itinerary.restaurants.count == 1
        @saved_markers = @itinerary.venues.first.lat + "," + @itinerary.venues.first.lng + "|" + @itinerary.venues.last.lat + "," + @itinerary.venues.last.lng + "|" + @itinerary.venues[1].lat + "," + @itinerary.venues[1].lng + "|" + @itinerary.restaurants.first.lat + "," + @itinerary.restaurants.first.lng
      else
        @saved_markers = @itinerary.venues.first.lat + "," + @itinerary.venues.first.lng + "|" + @itinerary.venues.last.lat + "," + @itinerary.venues.last.lng + "|" + @itinerary.venues[1].lat + "," + @itinerary.venues[1].lng
      end
    elsif @itinerary.venues.count == 2
      if @itinerary.restaurants.count > 0
        @saved_markers = @itinerary.venues.first.lat + "," + @itinerary.venues.first.lng + "|" + @itinerary.venues.last.lat + "," + @itinerary.venues.last.lng + "|" + @itinerary.restaurants.first.lat + "," + @itinerary.restaurants.first.lng
      else 
        @saved_markers = @itinerary.venues.first.lat + "," + @itinerary.venues.first.lng + "|" + @itinerary.venues.last.lat + "," + @itinerary.venues.last.lng
      end
    elsif @itinerary.venues.count == 1
      if @itinerary.restaurants.count > 0
        @saved_markers = @itinerary.venues.first.lat + "," + @itinerary.venues.first.lng + "|" + @itinerary.restaurants.first.lat + "," + @itinerary.restaurants.first.lng
      else @saved_markers = @itinerary.venues.first.lat + "," + @itinerary.venues.first.lng
      end   
    end
  end 

  def create
    @restaurant = Restaurant.new(
      api_id: params[:api_id],
      name: params[:name],
      lat: params[:lat],
      lng: params[:lng],
      address: params[:address],
      phone: params[:phone],
      itinerary_id: params[:itinerary_id]
    )
    @restaurant.save
    redirect_to "/itineraries/#{@restaurant.itinerary_id}/edit" 
  end 
  
  def destroy
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    @restaurant.destroy
    redirect_to "/itineraries/#{params[:itinerary_id]}/edit"
  end  
end
