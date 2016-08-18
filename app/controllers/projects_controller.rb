class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  def show
  
  end
  def edit
  
  #   @data = Unirest.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=zoos+near+Chicago&key=#{ENV['GOOGLE_PLACES_KEY']}").body
  # render json: @data
  end
end
