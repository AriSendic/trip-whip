class ItineraryPdf < Prawn::Document
  def initialize(itinerary, view)
    super()
    @itinerary = itinerary
    @view = view
    logo 
    itinerary_name
    venues
    restaurants
  end

  def itinerary_name
    text "Your trip: \##{@itinerary.title}", size: 30, style: :bold
  end

  def venues
    move_down 20
    table venue_rows
  end  
   
  def venue_rows
    [["Venue Name", "Address", "Phone"]] +
      @itinerary.venues.map do |venue| 
        [venue.name, venue.address, venue.phone]
      end
  end

  def restaurants
    if @itinerary.restaurants.count > 0 
      move_down 20
      table restaurant_rows
    end
  end  
   
  def restaurant_rows
    if @itinerary.restaurants.count > 0
      [["Restaurant Name", "Address", "Phone"]] +
        @itinerary.restaurants.map do |restaurant| 
          [restaurant.name, restaurant.address, restaurant.phone]
        end
    end  
  end
  
  def logo
    logopath = "#{Rails.root}/app/assets/images/logo.png"
    image logopath, :width => 197, :height => 79
    text "Created on #{@itinerary.created_at.strftime('%A, %b %d')}"
    move_down 20 
  end 

   
end