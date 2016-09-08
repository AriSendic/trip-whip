class ItineraryPdf < Prawn::Document
  def initialize(itinerary)
    super()
    @itinerary = itinerary
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
    move_down 20
    table restaurant_rows
  end  
   
  def restaurant_rows
    [["Restaurant Name", "Address", "Phone"]] +
      @itinerary.restaurants.map do |restaurant| 
        [restaurant.name, restaurant.address, restaurant.phone]
      end
  end
end