class PostsController < ApplicationController
  def index
  end
  
  def create
    post = Post.create(
      user_id: params[:user_id],
      api_id: params[:api_id],
      time: params[:time],
      text: params[:text]
    )
    redirect_to "/itineraries/#{params[:itinerary_id]}"
  end
  
  def show
    
  end
end
