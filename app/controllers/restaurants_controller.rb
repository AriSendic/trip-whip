class RestaurantsController < ApplicationController
  def index
    lat = params[:lat]
    lng = params[:lng]
    type = params[:type]

    # @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_KEY'])
    # @data = @client.spots_by_query(type.to_s, :types => 'restaurant', :exclude => ['night_club', 'bar'], :location => {lat}, #{lng}", :radius => "10000")
    # render json: @data
    @data = Unirest.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants&key=#{ENV['GOOGLE_PLACES_KEY']}&location=#{lat},#{lng}&rankby=distance&type=#{type}").body
    render json: @data 
  end
end
