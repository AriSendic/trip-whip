class RestaurantsController < ApplicationController
  def index
    lat = params[:lat]
    lng = params[:lng]
    type = params[:type]

    # @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_KEY'])
    # @data = @client.spots_by_query(type.to_s, :types => 'restaurant', :exclude => ['night_club', 'bar'], :location => {lat}, #{lng}", :radius => "10000")
    # render json: @data
    @data = Unirest.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{type}&key=#{ENV['GOOGLE_PLACES_KEY']}&location=#{lat},#{lng}&rankby=distance&type=restaurant").body
    # render json: @data 
  end

  def show
    @restaurant_id = params[:restaurant_id]
    @data = Unirest.get("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{@restaurant_id}&key=#{ENV['GOOGLE_PLACES_KEY']}").body
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
    redirect_to "/itinerary/#{@restaurant.itinerary_id}" 
  end 
end
