Restaurant.destroy_all
Venue.destroy_all
User.destroy_all
Post.destroy_all
Project.destroy_all
Itinerary.destroy_all
names = ['Snap', 'Crackle', 'Pop']

names.each do |name|
  user = User.create(
    name: name,
    email: "#{name}@#{name}.com".downcase,
    password: "password"
  )
  3.times do
    itinerary = Itinerary.create(
      title: Faker::Hipster.word,
      user_id: user.id
    )
    project = Project.create(
      name: Faker::Hipster.word,
      instructions: Faker::Hipster.paragraph,
      time: rand(15..240),
      user_id: user.id,
      materials: Faker::Hipster.words(4, true, true),
      sort: 3,
      itinerary_id: itinerary.id
    )
    restaurant = Restaurant.create(
      api_id: Faker::Code.asin,
      name: Faker::Company.name,
      itinerary_id: itinerary.id,
      sort: 2
    )
    venue = Venue.create(
      api_id: Faker::Code.asin,
      name: Faker::Team.name,
      itinerary_id: itinerary.id,
      sort: 1
    )
    post = Post.create(
      api_id: venue.api_id,
      text: Faker::Lorem.paragraph(6),
      time: rand(30..600),
      user_id: user.id
    ) 
  end
end