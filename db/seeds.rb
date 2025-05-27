puts "cleaning the database 🧼"
Spot.delete_all
User.delete_all

puts "creating a user for the db"
User.create(first_name: "Jon", last_name: "Smith", email: "test@testemail.com" )
puts "finished creating the user"


puts "creating a spot for the db"
