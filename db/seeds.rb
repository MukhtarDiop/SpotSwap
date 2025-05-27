User.destroy_all
Spot.destroy_all

user1 = User.new(first_name: "test1", last_name: "user", email: "a@a.a", password: "aaa111")
user1.save
user2 = User.new(first_name: "test2", last_name: "user", email: "a@a.aa", password: "aaa1112")
user2.save

user3 = User.new(first_name: "renter1", last_name: "user", email: "a@a.aaa", password: "aaa1112")
user3.save

spot1 = Spot.new(description: "storage room", category: "storage", lat: 0.45526189e2, long: -0.73595311e2, length: 0.3e1, width: 0.2e1, height: 0.4e1, user_id: 1)
spot1.save

puts "completed the seeds"
