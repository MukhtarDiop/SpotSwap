require "open-uri"

puts "Cleaning database...🧹"
Booking.destroy_all
Spot.destroy_all
User.destroy_all

puts "Creating users...👯"
naika   = User.create!(email: "naika@example.com", password: "password", first_name: "Naika", last_name: "E")
mukhtar = User.create!(email: "mukhtar@example.com", password: "password", first_name: "Mukhtar", last_name: "N")
mateo   = User.create!(email: "mateo@example.com", password: "password", first_name: "Mateo", last_name: "M")
safwan  = User.create!(email: "safwan@example.com", password: "password", first_name: "Safwan", last_name: "A")
davy    = User.create!(email: "davy@example.com", password: "password", first_name: "Devy", last_name: "D")

puts "Creating additional test users... 🙋🏼"
user1 = User.create!(email: "lena@example.com", password: "password", first_name: "Lena", last_name: "T")
user2 = User.create!(email: "omar@example.com", password: "password", first_name: "Omar", last_name: "R")
user3 = User.create!(email: "claire@example.com", password: "password", first_name: "Claire", last_name: "P")
user4 = User.create!(email: "diego@example.com", password: "password", first_name: "Diego", last_name: "M")

puts "Creating spots for Naika... 👩🏾‍💻"
spot1 = Spot.create!(
  title: "Downtown Garage Spot",
  description: "Indoor garage in the city center. Safe, secure, and easily accessible.",
  category: "garage",
  rate: 18.0,
  length: 4.5,
  width: 2.5,
  height: 2.0,
  address: "100 Montgomery St, San Francisco, CA 94104",
  user: naika
)
# file = URI.open("https://res.cloudinary.com/YOUR_CLOUD_NAME/image/upload/v1234567890/downtown_garage.jpg")
# spot1.photos.attach(io: file, filename: "downtown_garage.jpg", content_type: "image/jpg")

spot2 = Spot.create!(
  title: "Basement Storage Room",
  description: "Dry, clean basement storage room in private home. Easy to access and secure.",
  category: "storage",
  rate: 12.0,
  length: 3.0,
  width: 2.0,
  height: 2.5,
  address: "823 Divisadero St, San Francisco, CA 94117",
  user: naika
)
# file = URI.open("https://res.cloudinary.com/YOUR_CLOUD_NAME/image/upload/v1234567890/storage_room.jpg")
# spot2.photos.attach(io: file, filename: "storage_room.jpg", content_type: "image/jpg")

spot3 = Spot.create!(
   title: "Civic Center Parking Spot",
  description: "Outdoor parking with camera surveillance near Civic Center. Accessible anytime.",
  category: "parking",
  rate: 15.0,
  length: 5.0,
  width: 2.5,
  height: 2.5,
  address: "355 McAllister St, San Francisco, CA 94102",
  user: naika
)
# file = URI.open("https://res.cloudinary.com/YOUR_CLOUD_NAME/image/upload/v1234567890/parking_spot.jpg")
# spot3.photos.attach(io: file, filename: "parking_spot.jpg", content_type: "image/jpg")

puts "Creating spots for Mateo... 👨🏻‍💻"
spot4 = Spot.create!(
  title: "Garage in Mission District",
  description: "Covered garage with private key access. Best for motorcycles or compact cars.",
  category: "garage",
  rate: 20.0,
  length: 4.0,
  width: 2.2,
  height: 2.0,
  address: "2600 Harrison St, San Francisco, CA 94110",
  user: mateo
)
# file = URI.open("https://res.cloudinary.com/YOUR_CLOUD_NAME/image/upload/v1234567890/mission_garage.jpg")
# spot4.photos.attach(io: file, filename: "mission_garage.jpg", content_type: "image/jpg")

spot5 = Spot.create!(
  title: "Spare Closet Storage",
  description: "Clean closet in smoke-free home. Good for boxes, clothes, or small items.",
  category: "storage",
  rate: 10.0,
  length: 2.0,
  width: 1.5,
  height: 2.0,
  address: "948 Valencia St, San Francisco, CA 94110",
  user: mateo
)
# file = URI.open("https://res.cloudinary.com/YOUR_CLOUD_NAME/image/upload/v1234567890/spare_closet.jpg")
# spot5.photos.attach(io: file, filename: "spare_closet.jpg", content_type: "image/jpg")

puts "Creating spots for Lena...🙋🏼‍♀️"
spot6 = Spot.create!(
  title: "Downtown Parking Spot",
  description: "Open-air parking with quick access to main streets. Located downtown.",
  category: "parking",
  rate: 16.0,
  length: 5.0,
  width: 2.5,
  height: 2.5,
  address: "123 Market St, San Francisco, CA 94103",
  user: user1
)
# file = URI.open("https://via.placeholder.com/600x400.png?text=Parking+Spot")
# spot6.photos.attach(io: file, filename: "parking_spot2.png", content_type: "image/png")

spot7 = Spot.create!(
  title: "Garage Spot with EV Charger",
  description: "Secure garage space with electric vehicle charger. Gated community access.",
  category: "garage",
  rate: 25.0,
  length: 5.0,
  width: 3.0,
  height: 2.2,
  address: "456 Mission St, San Francisco, CA 94105",
  user: user1
)
# file = URI.open("https://via.placeholder.com/600x400.png?text=Garage+Spot+EV")
# spot7.photos.attach(io: file, filename: "garage_ev.png", content_type: "image/png")

spot8 = Spot.create!(
  title: "Storage Near BART Station",
  description: "Secure, dry storage locker close to public transit and BART station.",
  category: "storage",
  rate: 14.0,
  length: 3.0,
  width: 2.0,
  height: 2.5,
  address: "789 Howard St, San Francisco, CA 94103",
  user: user1
)
# file = URI.open("https://via.placeholder.com/600x400.png?text=Storage+Locker")
# spot8.photos.attach(io: file, filename: "storage_locker.png", content_type: "image/png")

spot9 = Spot.create!(
  title: "Compact Car Parking Spot",
  description: "Narrow parking for small cars only. Ideal for compact vehicles in the city.",
  category: "parking",
  rate: 12.0,
  length: 4.0,
  width: 2.0,
  height: 2.5,
  address: "1010 Folsom St, San Francisco, CA 94103",
  user: user1
)
# file = URI.open("https://via.placeholder.com/600x400.png?text=Compact+Parking")
# spot9.photos.attach(io: file, filename: "compact_parking.png", content_type: "image/png")

puts "Creating spots for Omar...🤷🏽‍♂️"
spot10 = Spot.create!(
  title: "Garage with Workshop Space",
  description: "Garage with workbench and racks. Perfect for storage or small repairs.",
  category: "garage",
  rate: 22.0,
  length: 6.0,
  width: 3.5,
  height: 2.5,
  address: "2500 Van Ness Ave, San Francisco, CA 94109",
  user: user2
)
# file = URI.open("https://via.placeholder.com/600x400.png?text=Garage+Workshop")
# spot10.photos.attach(io: file, filename: "garage_workshop.png", content_type: "image/png")

spot11 = Spot.create!(
  title: "Gated Storage Unit",
  description: "Storage unit in secure gated complex with 24/7 camera monitoring.",
  category: "storage",
  rate: 18.0,
  length: 3.5,
  width: 2.5,
  height: 2.5,
  address: "1111 Pine St, San Francisco, CA 94108",
  user: user2
)
# file = URI.open("https://via.placeholder.com/600x400.png?text=Storage+Unit")
# spot11.photos.attach(io: file, filename: "storage_unit.png", content_type: "image/png")

spot12 = Spot.create!(
  title: "Outdoor Covered Parking",
  description: "Covered parking spot with direct street access. Centrally located.",
  category: "parking",
  rate: 14.0,
  length: 5.0,
  width: 2.5,
  height: 2.5,
  address: "500 Howard St, San Francisco, CA 94105",
  user: user2
)
# file = URI.open("https://via.placeholder.com/600x400.png?text=Outdoor+Parking")
# spot12.photos.attach(io: file, filename: "outdoor_parking.png", content_type: "image/png")

spot13 = Spot.create!(
  title: "Bay Area Garage Spot",
  description: "Spacious garage near the waterfront. Easy access to major roads.",
  category: "garage",
  rate: 19.0,
  length: 5.0,
  width: 2.8,
  height: 2.3,
  address: "1500 Terry A Francois Blvd, San Francisco, CA 94158",
  user: user2
)
# file = URI.open("https://via.placeholder.com/600x400.png?text=Bay+Garage")
# spot13.photos.attach(io: file, filename: "bay_garage.png", content_type: "image/png")

puts "Creating spots for Claire...🧘🏾‍♀️"

spot14 = Spot.create!(
  title: "Garage Space in Seattle",
  description: "Secure garage spot near downtown Seattle. Close to I-5 and central spots.",
  category: "garage",
  rate: 22.0,
  length: 5.0,
  width: 2.7,
  height: 2.2,
  address: "200 1st Ave N, Seattle, WA 98109, USA",
  user: user3
)
# file = URI.open("https://via.placeholder.com/600x400.png?text=Seattle+Garage")
# spot14.photos.attach(io: file, filename: "seattle_garage.png", content_type: "image/png")

spot15 = Spot.create!(
  title: "Toronto Parking Spot",
  description: "Outdoor parking in safe area with public transport access nearby.",
  category: "parking",
  rate: 17.0,
  length: 5.0,
  width: 2.5,
  height: 2.5,
  address: "123 Queen St W, Toronto, ON M5H 2M9, Canada",
  user: user3
)
# file = URI.open("https://via.placeholder.com/600x400.png?text=Toronto+Parking")
# spot15.photos.attach(io: file, filename: "toronto_parking.png", content_type: "image/png")

puts "Creating spots for Diego...🧔🏼‍♂️"

spot16 = Spot.create!(
  title: "Storage in Mexico City",
  description: "Dry, covered storage close to downtown Mexico City. Secure building.",
  category: "storage",
  rate: 14.0,
  length: 3.5,
  width: 2.0,
  height: 2.5,
  address: "Av. Insurgentes Sur 1234, Del Valle, 03100 Ciudad de México, CDMX, Mexico",
  user: user4
)
# file = URI.open("https://via.placeholder.com/600x400.png?text=Mexico+Storage")
# spot16.photos.attach(io: file, filename: "mexico_storage.png", content_type: "image/png")

spot17 = Spot.create!(
  title: "Garage in Vancouver",
  description: "Secure garage in central Vancouver with 24/7 entry and surveillance.",
  category: "garage",
  rate: 24.0,
  length: 5.5,
  width: 2.6,
  height: 2.4,
  address: "555 Burrard St, Vancouver, BC V7X 1M3, Canada",
  user: user4
)
# file = URI.open("https://via.placeholder.com/600x400.png?text=Vancouver+Garage")
# spot17.photos.attach(io: file, filename: "vancouver_garage.png", content_type: "image/png")

spot18 = Spot.create!(
  title: "Underground Garage Space",
  description: "Underground garage with gated entry. Central location, well-lit and secure.",
  category: "garage",
  rate: 24.0,
  length: 5.5,
  width: 2.6,
  height: 2.4,
  address: "555 Burrard St, Vancouver, BC V7X 1M3, Canada",
  user: user4
)
# file = URI.open("https://via.placeholder.com/600x400.png?text=Vancouver+Garage")
# spot17.photos.attach(io: file, filename: "vancouver_garage.png", content_type: "image/png")

puts "Creating bookings... 🧟"

guests = User.where.not(id: [naika.id, mateo.id])
spots = Spot.all
today = Date.today

Booking.create!(
  user: guests.sample,
  spot: spots.first,
  start_date: today + 3,
  end_date: today + 7,
  status: "pending"
)

Booking.create!(
  user: guests.sample,
  spot: spots.second,
  start_date: today + 5,
  end_date: today + 10,
  status: "pending"
)

Booking.create!(
  user: guests.sample,
  spot: spots.third,
  start_date: today + 8,
  end_date: today + 12,
  status: "pending"
)

Booking.create!(
  user: guests.sample,
  spot: spots.fourth,
  start_date: today + 1,
  end_date: today + 3,
  status: "pending"
)

Booking.create!(
  user: guests.sample,
  spot: spots.fifth,
  start_date: today + 15,
  end_date: today + 20,
  status: "pending"
)

puts "Seeding complete! 🌱"
