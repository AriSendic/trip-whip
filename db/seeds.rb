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
  2.times do
  project = Project.create(
    name: Faker::Hipster.word,
    instructions: Faker::Hipster.paragraph,
    time: rand(15..240),
    user_id: user.id,
    materials: Faker::Hipster.words(4, true, true)
  )
  3.times do
      itinerary = Itinerary.create(
        venue_id: Faker::Company.name,
        food_id: Faker::Company.name,
        user_id: user.id
      )
      2.times do
        post = Post.create(
          venue_id: itinerary.venue_id,
          text: Faker::Lorem.paragraph(6),
          time: rand(30..600),
          user_id: user.id
        )
      end
    end
  end
end