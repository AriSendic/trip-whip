class ItineraryPdf < Prawn::Document
  def initialize(itinerary)
    super()
    @itinerary = itinerary
    itinerary_name
    venues
  end
  def itinerary_name
    text "Itinerary \##{@itinerary.title}", size: 30
   end

  def venues
    move_down 20
    table venue_rows
    # table [[1,2], [3,4]]
  end  
   
  def venue_rows
    [["Venue Name", "Address", "Phone"]] +
    @itinerary.venues.map do |venue| 
      [venue.name, venue.address, venue.phone]
    end
  end
end