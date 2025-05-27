# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#Booking.create!(

# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


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
