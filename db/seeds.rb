# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user1 = User.new(first_name: "test1", last_name: "user", email: "a@a.a", password: "aaa111")
user1.save
user2 = User.new(first_name: "test2", last_name: "user", email: "a@a.aa", password: "aaa1112")
user2.save

user3 = User.new(first_name: "renter1", last_name: "user", email: "a@a.aaa", password: "aaa1112")
user3.save

spot1 = Spot.new(description: "storage room", category: "storage", lat: 0.45526189e2, long: -0.73595311e2, length: 0.3e1, width: 0.2e1, height: 0.4e1, user_id: 1)
spot1.save
