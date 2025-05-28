puts "Cleaning the database"
Booking.destroy_all
Spot.destroy_all
User.destroy_all

puts "Creating users."
# Create a test user if none exists
user = User.create!(
  first_name: "Test",
  last_name: "User",
  email: "test@example.com",
  password: "password"
)

# Create a second user
second_user = User.create!(
  first_name: "Renter",
  last_name: "User",
  email: "renter@example.com",
  password: "password"
)

puts "Creating a spot"
# Create a spot if none exists
spot = Spot.create!(
  description: "Test Storage Spot",
  category: "storage",
  address: "5333 ave casgrain, Montreal",
  rate: 25,
  length: 10,
  width: 10,
  height: 8,
  user: user
)

puts "Creating a booking"
# Now create a booking
Booking.create!(
  user: user,
  spot: spot,
  start_date: Date.today,
  end_date: Date.today + 7,
  status: "pending"
)
