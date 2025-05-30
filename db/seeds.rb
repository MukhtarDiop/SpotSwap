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
davy    = User.create!(email: "davy@example.com", password: "password", first_name: "Davy", last_name: "D")

puts "Creating additional test users... 🙋🏼"
user1 = User.create!(email: "lena@example.com", password: "password", first_name: "Lena", last_name: "T")
user2 = User.create!(email: "omar@example.com", password: "password", first_name: "Omar", last_name: "R")
user3 = User.create!(email: "claire@example.com", password: "password", first_name: "Claire", last_name: "P")
user4 = User.create!(email: "diego@example.com", password: "password", first_name: "Diego", last_name: "M")

puts "Creating spots for Naika... 👩🏾‍💻"
spot1 = Spot.create!(
  title: "Downtown Garage Spot",
  description: "Indoor garage in the city center. Safe, secure, and easily accessible.",
  category: "parking",
  rate: 18.0,
  length: 4.5,
  width: 2.5,
  height: 2.0,
  address: "100 Montgomery St, San Francisco, CA 94104",
  user: naika
)
file = URI.open("https://images.unsplash.com/photo-1699877905495-6989b30175ad?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
spot1.photos.attach(io: file, filename: "downtown_garage.jpg", content_type: "image/jpg")

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
file = URI.open("https://images.unsplash.com/photo-1635108198322-18c814f9b70f?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
spot2.photos.attach(io: file, filename: "storage_room.jpg", content_type: "image/jpg")

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
file = URI.open("https://images.unsplash.com/photo-1623683786184-e526cc99c060?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
spot3.photos.attach(io: file, filename: "parking_spot.jpg", content_type: "image/jpg")

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
file = URI.open("https://plus.unsplash.com/premium_photo-1730910017155-f7c186a5f690?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
spot4.photos.attach(io: file, filename: "mission_garage.jpg", content_type: "image/jpg")

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
file = URI.open("https://images.unsplash.com/photo-1721522010396-2710418c17de?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGVtcHR5JTIwc3RvcmFnZSUyMGNsb3NldHxlbnwwfHwwfHx8MA%3D%3D")
spot5.photos.attach(io: file, filename: "spare_closet.jpg", content_type: "image/jpg")

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
file = URI.open("https://images.unsplash.com/photo-1523362612182-052e9ff2c8da?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
spot6.photos.attach(io: file, filename: "parking_spot2.png", content_type: "image/png")

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
file = URI.open("https://images.unsplash.com/photo-1572094943263-a746cbf1d05f?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
spot7.photos.attach(io: file, filename: "garage_ev.png", content_type: "image/png")

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
file = URI.open("https://images.unsplash.com/photo-1683984210404-d9fd70a40d02?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
spot8.photos.attach(io: file, filename: "storage_locker.png", content_type: "image/png")

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
file = URI.open("https://images.unsplash.com/photo-1529089059310-92aa39a13908?q=80&w=2591&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
spot9.photos.attach(io: file, filename: "compact_parking.png", content_type: "image/png")

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
file = URI.open("https://images.unsplash.com/photo-1635108198395-82a67cd5eaec?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
spot10.photos.attach(io: file, filename: "garage_workshop.png", content_type: "image/png")

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
file = URI.open("https://images.unsplash.com/photo-1694601618351-dbbbb2b8934f?q=80&w=3174&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
spot11.photos.attach(io: file, filename: "storage_unit.png", content_type: "image/png")

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
file = URI.open("https://images.unsplash.com/photo-1693054367370-41ccf4dc8674?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
spot12.photos.attach(io: file, filename: "outdoor_parking.png", content_type: "image/png")

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
file = URI.open("https://images.unsplash.com/photo-1635108198165-1773945e506e?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
spot13.photos.attach(io: file, filename: "bay_garage.png", content_type: "image/png")

puts "Creating spots for Claire...🧘🏾‍♀️"

spot14 = Spot.create!(
  title: "Garage Space in Seattle",
  description: "Secure garage spot near downtown Seattle. Close to I-5 and central spots.",
  category: "parking",
  rate: 22.0,
  length: 5.0,
  width: 2.7,
  height: 2.2,
  address: "200 1st Ave N, Seattle, WA 98109, USA",
  user: user3
)
file = URI.open("https://images.unsplash.com/photo-1614972625561-bc56585aba6b?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
spot14.photos.attach(io: file, filename: "seattle_garage.png", content_type: "image/png")

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
file = URI.open("https://images.unsplash.com/photo-1662021163989-f0d185a5442d?q=80&w=2954&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
spot15.photos.attach(io: file, filename: "toronto_parking.png", content_type: "image/png")

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
file = URI.open("https://images.unsplash.com/photo-1551313158-73d016a829ae?q=80&w=2937&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
spot16.photos.attach(io: file, filename: "mexico_storage.png", content_type: "image/png")

spot17 = Spot.create!(
  title: "Garage in Vancouver",
  description: "Secure garage in central Vancouver with 24/7 entry and surveillance.",
  category: "parking",
  rate: 24.0,
  length: 5.5,
  width: 2.6,
  height: 2.4,
  address: "555 Burrard St, Vancouver, BC V7X 1M3, Canada",
  user: user4
)
file = URI.open("https://images.unsplash.com/photo-1588482683425-6b5858b06896?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
spot17.photos.attach(io: file, filename: "vancouver_garage.png", content_type: "image/png")

spot18 = Spot.create!(
  title: "Underground Garage Space",
  description: "Underground garage with gated entry. Central location, well-lit and secure.",
  category: "parking",
  rate: 24.0,
  length: 5.5,
  width: 2.6,
  height: 2.4,
  address: "555 Burrard St, Vancouver, BC V7X 1M3, Canada",
  user: user4
)
file = URI.open("https://images.unsplash.com/photo-1608626057093-91eb066ae1a3?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
spot18.photos.attach(io: file, filename: "vancouver_garage.png", content_type: "image/png")

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
