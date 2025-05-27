# Create a user if none exists
user = User.first || User.create!(
  first_name: "Test",
  last_name: "User",
  email: "test@example.com",
  password: "password"
)

# Create a spot if none exists
spot = Spot.first || Spot.create!(
  description: "Test Storage Spot",
  category: "storage",
  lat: 47.6062,
  long: -122.3321,
  rate: 25,
  length: 10,
  width: 10,
  height: 8,
  user: user
)

# Now create a booking
Booking.create!(
  user: user,
  spot: spot,
  start_date: Date.today,
  end_date: Date.today + 7,
  status: "pending"
)