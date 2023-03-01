# Tour records
Tour.create(name: "Barcelona City Tour", description: "See the best sights of Barcelona in just one day.", price: 50, date: Date.today)
Tour.create(name: "Gaudi Architecture Tour", description: "Explore the stunning works of Antoni Gaudi in Barcelona.", price: 75, date: Date.today + 1.week)
Tour.create(name: "Tapas and Wine Tour", description: "Discover the best tapas and wines in the city on this culinary tour.", price: 100, date: Date.today + 2.weeks)
Tour.create(name: "Gothic Quarter Walking Tour", description: "Discover the Gothic Quarter, Barcelona’s oldest and most charming neighborhood. Explore the narrow streets and hidden squares while learning about the city’s rich history and culture.", price: 25, date: Date.new(2023, 4, 15))
Tour.create(name: "Modernisme Architecture Tour", description: "Take a tour of Barcelona’s iconic Modernisme architecture, including Gaudí’s famous works such as the Sagrada Familia and Park Güell, and other lesser-known but equally stunning buildings throughout the city.", price: 30, date: Date.new(2023, 4, 22))
Tour.create(name: "Foodie Tour of El Born", description: "Experience the delicious flavors of Barcelona’s El Born neighborhood on a culinary walking tour. Sample a variety of traditional Catalan dishes and drinks while learning about the history and culture behind them.", price: 40, date: Date.new(2023, 5, 1))
Tour.create(name: "Barcelona Bike Tour", description: "Explore the city’s main sights and hidden gems on a bike tour. Ride along the waterfront, through parks and gardens, and past some of the city’s most iconic landmarks while enjoying the fresh air and exercise.", price: 35, date: Date.new(2023, 5, 7))

# User record
user = User.create(email: "andreslloretsz@gmail.com", password: "Kutyus.00")

# Assign the user to each Tour
Tour.all.each do |tour|
  tour.user = user
  tour.save
  puts "Assigned user to #{tour.name}"
end

# Create 5 additional Tours and assign the User to each
5.times do
  tour = Tour.create(name: "Barcelona City Tour", description: "See the best sights of Barcelona in just one day.", price: 50, date: Date.today)
  tour.user = user
  tour.save
  puts "Created #{tour.name}"
end
