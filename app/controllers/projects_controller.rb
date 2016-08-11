class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  def show
  
  end
  def edit
    @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_KEY'])
    @data = @client.spots_by_query('attractions near Chicago Illinois', :types => ['zoo', 'museum', 'park', 'bowling_alley', 'amusement_park', 'aquarium'])
    # @data = Unirest.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=attractions+in+Chicago&types=(zoo|museum|bowling_alley|amusement_park|aquarium|park)&key=#{ENV['GOOGLE_PLACES_KEY']}").body
  # render json: @data
  end
end
