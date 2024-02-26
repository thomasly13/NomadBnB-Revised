# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

    require "open-uri"
    require "faker"

    ran = Random.new();
    puts "Destroying tables..."
    # Unnecessary if using `rails db:seed:replant`
    User.destroy_all
    Listing.destroy_all
    Reservation.destroy_all
    Review.destroy_all
  
    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User` has `id` of 1
    ApplicationRecord.connection.reset_pk_sequence!('users')
    ApplicationRecord.connection.reset_pk_sequence!('listings')
    ApplicationRecord.connection.reset_pk_sequence!('reservations')
    ApplicationRecord.connection.reset_pk_sequence!('reviews')
  
    puts "Creating users..."
    # Create one user with an easy to remember username, email, and password:
    User.create!(
      first_name: 'Demo', 
      last_name: 'Lition', 
      email: 'demo@user.com', 
      password: 'password'
    )

    User.create!(
      first_name: 'Hanna', 
      last_name: 'Darwish', 
      email: 'hanna@user.com', 
      password: 'password'
    )

    1.times do 
      User.create!({
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.unique.email,
        password: 'password'
      }) 
    end

    User.create!(
      first_name: 'Jasvneet', 
      last_name: 'Kaur', 
      email: 'jas@user.com', 
      password: 'password'
    )

  
    # More users
    7.times do 
      User.create!({
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.unique.email,
        password: 'password'
      }) 
    end

    User.create!(
      first_name: 'Akea', 
      last_name: 'Jamesbradley', 
      email: 'Akea@user.com', 
      password: 'password'
    )

    User.create!(
      first_name: 'Shanna', 
      last_name: 'Le', 
      email: 'Shanna@user.com', 
      password: 'password'
    )

    3.times do 
      User.create!({
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.unique.email,
        password: 'password'
      }) 
    end

    User.create!(
      first_name: 'Matt', 
      last_name: 'Dawg', 
      email: 'matt@user.com', 
      password: 'password'
    )

    20.times do 
      User.create!({
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.unique.email,
        password: 'password'
      }) 
    end

 
    puts 'Creating listings...'

    listing_1 = Listing.create!(
      name: 'Luxury Beach View Apartment' ,
      description: 'Just a short stroll from beautiful LindaMar Beach, this large private spacious studio is perfect for your next beach getaway. It has a breathtaking unobstructed  ocean view which can be seen from anywhere in the unit, including the bathroom and shower. Surfboard rental is included with your stay offering a bonus activity for your trip! There is a huge private deck with a wraparound bench, lounge chairs, and a sunbed for your enjoyment while starring at one of the nicest ocean views in California' ,
      price: 194,
      address: "223 Stanley Ave, Pacifica, CA 94044",
      coordinates: '37.59493551449619 -122.51057679479852',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 2,
      num_of_baths: 1, 
      num_of_bedrooms: 1,
      num_of_beds: 1,
      owner_id: 1
    );
    
    listing_1.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-1.jpeg"), 
      filename: "listing1-1.jpeg"
    )

    listing_1.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-2.jpg"), 
      filename: "listing1-2.jpg"
    )

    listing_1.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-3.jpeg"), 
      filename: "listing1-3.jpeg"
    )
    listing_1.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-4.jpg"), 
      filename: "listing1-4.jpg"
    )
    listing_1.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-5.jpeg"), 
      filename: "listing1-5.jpg"
    )
    listing_1.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-1/listing1-6.jpeg"), 
      filename: "listing1-6.jpg"
    )
 


    listing_2 = Listing.create!(
      name: 'Coastal Chic: Central Parkside Hideaway' ,
      description: 'Relax in a safe, quiet, friendly neighborhood on your trip to San Francisco in the Parkside/Sunset district. Very safe and family-friendly neighborhood, close to Ocean Beach, Golden Gate Park, local restaurants, and malls. Perfect for families, trips with friends, or business travelers looking to work, relax, and explore San Francisco. Plenty of street parking, easy access to public transportation (29 and L Muni line), and plenty of Uber/Lyft options to get around the city as well!' ,
      price: 380,
      address: "2570 33rd Ave, San Francisco, CA 94116",
      coordinates: '37.73926211417792 -122.49023506458762',
      amenities: "Wifi Kitchen TV Parking",
      num_of_guests: 8,
      num_of_baths: 1, 
      num_of_bedrooms: 3,
      num_of_beds: 4,
      owner_id: 2
    )

    listing_2.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-2/listing-2-1.jpeg"), 
      filename: "listing2-1.jpg"
    )
    listing_2.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-2/listing-2-2.jpeg"), 
      filename: "listing2-2.jpg"
    )
    listing_2.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-2/listing-2-3.jpeg"), 
      filename: "listing2-3.jpg"
    )
    listing_2.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-2/listing-2-4.jpeg"), 
      filename: "listing2-4.jpg"
    )
    listing_2.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-2/listing-2-5.jpeg"), 
      filename: "listing2-5.jpg"
    )
    listing_2.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-2/listing-2-6.jpeg"), 
      filename: "listing2-6.jpg"
    )



    listing_3 = Listing.create!(
      name: 'Coastal Chic: Central Parkside Hideaway' ,
      description: 'Relax in a safe, quiet, friendly neighborhood on your trip to San Francisco in the Parkside/Sunset district. Very safe and family-friendly neighborhood, close to Ocean Beach, Golden Gate Park, local restaurants, and malls. Perfect for families, trips with friends, or business travelers looking to work, relax, and explore San Francisco. Plenty of street parking, easy access to public transportation (29 and L Muni line), and plenty of Uber/Lyft options to get around the city as well!' ,
      price: 304,
      address: "1506 29th Ave, San Francisco, CA 94122",
      coordinates: '37.759343024254854 -122.48728974957982',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 8,
      num_of_baths: 1, 
      num_of_bedrooms: 3,
      num_of_beds: 4,
      owner_id: 3
    );

    listing_3.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-3/listing-3-1.jpeg"), 
      filename: "listing3-1.jpg"
    )
    listing_3.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-3/listing-3-2.jpeg"), 
      filename: "listing3-2.jpg"
    )
    listing_3.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-3/listing-3-3.jpeg"), 
      filename: "listing3-3.jpg"
    )
    listing_3.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-3/listing-3-4.jpeg"), 
      filename: "listing3-4.jpg"
    )
    listing_3.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-3/listing-3-5.jpeg"), 
      filename: "listing3-5.jpg"
    )

    puts 'Creating listings 4'
    listing_4 = Listing.create!(
      name: 'Waterfront Tiburon with 180°view' ,
      description: 'Ranch style one story home divided into a main 2 bedroom 2 bath house and a fully equipped mother-in-law suite with uninterrupted water views from almost every room and a long deck stretching across the entire property. The home offers direct water access via stairs from the deck. This is an older home (the bathrooms in particular are a bit out of date) but we love it because the home has great character and charm and stunning views. If you prefer very modern houses, this may not be for you. However, all furnishings, mattresses, appliances, etc are brand new and the home is immaculately cleaned. The waterfront is extremely peaceful and private. The staircase down to the water is long and would not be ideal for very small children or people with impaired mobility. However for everyone else, we highly recommend you grab some wine and head down there for sunset, or coffee for sunrise is even more stunning.' ,
      price: 471,
      address: "1415-1417 43rd Ave, San Francisco, CA 94122",
      coordinates: '37.7576889948196 -122.50550329456419',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 7,
      num_of_baths: 3, 
      num_of_bedrooms: 4,
      num_of_beds: 4,
      owner_id: 4
    );

    listing_4.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-4/listing-4-1.jpeg"), 
      filename: "listing4-1.jpg"
    )
    listing_4.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-4/listing-4-2.jpeg"), 
      filename: "listing4-2.jpg"
    )
    listing_4.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-4/listing-4-3.jpeg"), 
      filename: "listing4-3.jpg"
    )
    listing_4.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-4/listing-4-4.webp"), 
      filename: "listing4-4.jpg"
    )
    listing_4.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-4/listing-4-5.webp"), 
      filename: "listing3-5.jpg"
    )

    listing_5 = Listing.create!(
      name: 'Serenity House Whit BBQ Near SF Airport' ,
      description: "Welcome to Serenity House, your perfect retreat in San Francisco. Our beautiful 3-bedroom house boasts stunning views of the San Francisco Bay , providing a serene and relaxing ambiance. Our large outdoor BBQ area is perfect for hosting fun gatherings with family and friends. Each bedroom is designed for your comfort. Located in a quiet and friendly neighborhood, Serenity House offers easy access to San Francisco's top attractions, making it the perfect home base for your stay." ,
      price: 354,
      address: "1550 46th Ave, San Francisco, CA 94122",
      coordinates: '37.76028551221444 -122.50293691134891',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 8,
      num_of_baths: 1, 
      num_of_bedrooms: 3,
      num_of_beds: 4,
      owner_id: 5
    );

    listing_5.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-5/listing-5-1.jpeg"), 
      filename: "listing5-1.jpg"
    )
    listing_5.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-5/listing-5-2.jpeg"), 
      filename: "listing5-2.jpg"
    )
    listing_5.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-5/listing-5-3.jpeg"), 
      filename: "listing5-3.jpg"
    )
    listing_5.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-5/listing-5-4.jpeg"), 
      filename: "listing5-4.jpg"
    )
    listing_5.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-5/listing-5-5.jpeg"), 
      filename: "listing5-5.jpg"
    )

    puts 'Creating listings 6'
    listing_6 = Listing.create!(
      name: 'Spectacular Ocean View Retreat' ,
      description: "Spectacular Ocean view zen retreat. Breath the ocean air, view sunrise/set. In walking distance to Mussel Rock beach for cliff gliding/breach walk/picnic, conveniently located 15 mins from San Francisco,  it is about 15 mins away from San Francisco, Moscone center, Ferry building; 20 mins from Silicon Valley. Close to Olympic Country club, mussel rock, Fort Funston and Many shopping places, restaurants are in surrounding area. Long term rental is possible, please contact us" ,
      price: 255,
      address: "1334 47th Ave, San Francisco, CA 94122",
      coordinates: '37.76164127902247 -122.5069379486968',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 9,
      num_of_baths: 2.5, 
      num_of_bedrooms: 3,
      num_of_beds: 3,
      owner_id: 6
    );

    listing_6.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-6/listing-6-1.jpeg"), 
      filename: "listing6-1.jpg"
    )
    listing_6.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-6/listing-6-2.jpeg"), 
      filename: "listing6-2.jpg"
    )
    listing_6.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-6/listing-6-3.jpeg"), 
      filename: "listing6-3.jpg"
    )
    listing_6.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-6/listing-6-4.jpeg"), 
      filename: "listing6-6.jpg"
    )
    listing_6.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-6/listing-6-5.jpeg"), 
      filename: "listing6-5.jpg"
    )

    listing_7 = Listing.create!(
      name: 'Luxurious Bayview Treehouse: Hot Tub, 15 min to SF' ,
      description: "Immerse yourself in an architectural gem that balances modern elegance and rustic allure. Our four-bedroom, three-bathroom sanctuary is your secluded escape amidst expansive greenery, a canvas for unforgettable moments." ,
      price: 521,
      address: "Johnstone Dr, San Francisco, CA 94131",
      coordinates: '37.75803112235651 -122.45563289627265',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 6,
      num_of_baths: 3, 
      num_of_bedrooms: 2,
      num_of_beds: 3,
      owner_id: 7
    );

    puts 'Creating listings 7'
    listing_7.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-7/lsiting-7-1.jpeg"), 
      filename: "listing7-1.jpg"
    )
    listing_7.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-7/listing-7-2.jpeg"), 
      filename: "listing7-2.jpg"
    )
    listing_7.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-7/listing-7-3.jpeg"), 
      filename: "listing7-3.jpg"
    )
    listing_7.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-7/listing-7-4.jpeg"), 
      filename: "listing7-7.jpg"
    )
    listing_7.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-7/lsiting-7-5.jpeg"), 
      filename: "listing7-5.jpg"
    )


    puts 'Creating listings 8'

    listing_8 = Listing.create!(
      name: 'Ocean/Beach Front 🏖🌊w/ Sweeping Oceanviews🌅🐳🪂' ,
      description: "Escape to our oceanfront sanctuary, just 15 mins from SF and SFO. Set on the second floor of a duplex, the large windows offer breathtaking ocean views. Relax to the sound of waves and the scent of the sea; embark on memorable activities like whale watching, surfing, gliding, or simply savoring stunning sunsets. Beach access is just across the street. Recently remodeled, our home boasts new smart appliances and technologies. Immerse yourself in coastal bliss at our enchanting retreat." ,
      price: 342,
      address: "Great Hwy, San Francisco, CA 94121",
      coordinates: '37.77482192204646 -122.51096200677',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 6,
      num_of_baths: 1, 
      num_of_bedrooms: 2,
      num_of_beds: 4,
      owner_id: 8
    );

    listing_8.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-8/listing-8-1.jpeg"), 
      filename: "listing8-1.jpg"
    )
    listing_8.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-8/listing-8-2.jpeg"), 
      filename: "listing8-2.jpg"
    )
    listing_8.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-8/listing-8-3.jpeg"), 
      filename: "listing8-3.jpg"
    )
    listing_8.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-8/listing-8-4.jpeg"), 
      filename: "listing8-4.jpg"
    )
    listing_8.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-8/listing-8-5.jpeg"), 
      filename: "listing8-5.jpg"
    )

    puts 'Creating listings 9'

    listing_9 = Listing.create!(
      name: 'Marbella Lane - Rejuvenating Coastal Oasis' ,
      description: "Tucked in the tranquil picturesque valley of Vallemar, this premium Lindahl cedar home offers serenity & convenience, with quick access to many traveling points. This home has a stylish cabin interior design, the spacious living room features skylights and large windows, with direct access to the backyard deck & a hot tub. Enjoy a cuppa while admiring the miraculous beauty of the forest & mountains surrounding you; might even catch the occasional spotting of a deer or fox." ,
      price: 464,
      address: "550 48th Ave, San Francisco, CA 94121",
      coordinates: '37.778040904173814 -122.50908090168522',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 8,
      num_of_baths: 3, 
      num_of_bedrooms: 3,
      num_of_beds: 4,
      owner_id: 9
    );

    listing_9.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-9/listing-9-1.jpeg"), 
      filename: "listing9-1.jpg"
    )
    listing_9.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-9/listing-9-2.jpeg"), 
      filename: "listing9-2.jpg"
    )
    listing_9.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-9/listing-9-3.jpeg"), 
      filename: "listing9-3.jpg"
    )
    listing_9.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-9/listing-9-4.jpeg"), 
      filename: "listing9-4.jpg"
    )
    listing_9.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-9/listing-9-5.jpeg"), 
      filename: "listing9-5.jpg"
    )

    listing_10 = Listing.create!(
      name: 'Oceanfront Boho Retreat - Pacific Sunset Views 🌅🌊🐳' ,
      description: "Remodeled oceanfront home with sweeping Pacific views and whale watching! Ultra clean and comfortable. The perfect cozy boho getaway for couples, families and travelers. 3 bed, 1 bath." ,
      price: 464,
      address: "798 Great Hwy, San Francisco, CA 94121",
      coordinates: '37.773434375018375 -122.51067433600103',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 7,
      num_of_baths: 1, 
      num_of_bedrooms: 3,
      num_of_beds: 5,
      owner_id: 10
    );

    listing_10.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-10/listing-10-1.jpeg"), 
      filename: "listing10-1.jpg"
    )
    listing_10.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-10/listing-10-2.png"), 
      filename: "listing10-2.jpg"
    )
    listing_10.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-10/listing-10-3.png"), 
      filename: "listing10-3.jpg"
    )
    listing_10.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-10/listing-10-4.png"), 
      filename: "listing10-4.jpg"
    )
    listing_10.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-10/listing-10-5.png"), 
      filename: "listing10-5.jpg"
    )

    puts 'Creating listings 11'

    listing_11 = Listing.create!(
      name: 'Bright spacious top of the hill with bay views' ,
      description: "Top of the hill house with beautiful bay views.
      Literally steps away from the park, go hiking as soon as you leave the front door.
      Multiple rooms with bay views.
      Has a parking space and street parking.
      There are 2 porches and a backyard.
      There are 3 bedrooms and 3 bathrooms. The master bedroom has beautiful bay views.
      The house is in a safe cul de sac, so expect it to be extremely quiet.
      15 minute drive to the airport.
      Bayshore caltrain is a ~20 minute walk or 5 minute drive away." ,
      price: 300,
      address: "782 43rd Ave, San Francisco, CA 94121",
      coordinates: '37.773957966800985 -122.50342634090312',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 5,
      num_of_baths: 3, 
      num_of_bedrooms: 3,
      num_of_beds: 3,
      owner_id: 11
    );

    
    listing_11.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-11/listing-11-1.jpeg"), 
      filename: "listing11-1.jpg"
    )
    listing_11.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-11/listing-11-2.jpeg"), 
      filename: "listing11-2.jpg"
    )
    listing_11.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-11/listing-11-3.jpeg"), 
      filename: "listing11-3.jpg"
    )
    listing_11.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-11/listing-11-4.jpeg"), 
      filename: "listing11-4.jpg"
    )
    listing_11.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-11/listing-11-5.jpeg"), 
      filename: "listing11-5.jpg"
    )

    listing_12 = Listing.create!(
      name: '2BR 2 BA High End Exclusive Use in SOMA/Moscone' ,
      description: "Exclusive Use Sunny 2 BR 2 BA condo in downtown SF, walking distance to shops/gym/grocery, restaurants/club district; Parking in garage extra fee. All high end appliances, flat screens in living room/master BR with wifi/Netflix. Both BA full premium tiled walk in showers. Owner's bedroom is in the rear of the house with a separate entrance. Owner will not access exclusive use area and remains behind locked door. You get the exclusive use of two out of three total bedrooms." ,
      price: 395,
      address: "746 27th Ave, San Francisco, CA 94121",
      coordinates: '37.775324950692195 -122.48637687669368',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 4,
      num_of_baths: 2, 
      num_of_bedrooms: 2,
      num_of_beds: 2,
      owner_id: 12
    );

    listing_12.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-12/listing-12-1.png"), 
      filename: "listing12-1.jpg"
    )
    listing_12.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-12/listing-12-2.png"), 
      filename: "listing12-2.jpg"
    )
    listing_12.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-12/listing-12-3.png"), 
      filename: "listing12-3.jpg"
    )
    listing_12.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-12/listing-12-4.png"), 
      filename: "listing12-4.jpg"
    )
    listing_12.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-12/listing-12-5.png"), 
      filename: "listing12-5.jpg"
    )

    puts 'Creating listings 13'
    listing_13 = Listing.create!(
      name: 'Modern Noe Valley home with private deck' ,
      description: "This tastefully done house is perfect for both work-from-home teams traveling to the Bay area or family and friends on a relaxing holiday. With hi-speed Wi-Fi (gigabit) throughout the house and backyard, and brightly lit rooms, you can work from any corner of the house. If you feel like exploring the neighborhood, you're within a 5 minute walk from cafes and restaurants. Walgreens is a 2 min walk, whole Foods and Starbucks are a 7 minute walk." ,
      price: 605,
      address: "636 20th Ave, San Francisco, CA 94121",
      coordinates: '37.775971290942906 -122.47888067382294',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 6,
      num_of_baths: 2, 
      num_of_bedrooms: 3,
      num_of_beds: 3,
      owner_id: 13
    );

    listing_13.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-13/listing-13-1.jpeg"), 
      filename: "listing13-1.jpg"
    )
    listing_13.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-13/listing-13-2.jpeg"), 
      filename: "listing13-2.jpg"
    )
    listing_13.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-13/listing-13-3.jpeg"), 
      filename: "listing13-3.jpg"
    )
    listing_13.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-13/listing-13-4.jpeg"), 
      filename: "listing13-4.jpg"
    )
    listing_13.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-13/listing-13-5.jpeg"), 
      filename: "listing13-5.jpg"
    )

    listing_14 = Listing.create!(
      name: 'Secluded Home with Views of Skyline and Twin Peaks' ,
      description: "Discover a quiet, secluded retreat at the end of a small cul-de-sac on the north slope of Bernal Heights. With just one immediate neighbor, a huge yard, and a mini park across the street, this semi-detached home offers discreet & peaceful living not often found in the city. Enjoy Bernal's small-town vibe from the comfort of an updated abode featuring views of the skyline & Twin Peaks. You'll love the living space with two bay windows and lots of natural light." ,
      price: 420,
      address: "267 Buena Vista Ave W, San Francisco, CA 94117",
      coordinates: '37.76805482376914 -122.4391050998598',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 11,
      num_of_baths: 2, 
      num_of_bedrooms: 3,
      num_of_beds: 6,
      owner_id: 14
    );

    listing_14.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-14/listing-14-1.jpeg"), 
      filename: "listing14-1.jpg"
    )
    listing_14.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-14/listing-14-2.jpeg"), 
      filename: "listing14-2.jpg"
    )
    listing_14.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-14/listing-14-3.jpeg"), 
      filename: "listing14-3.jpg"
    )
    listing_14.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-14/listing-14-4.jpeg"), 
      filename: "listing14-4.jpg"
    )
    listing_14.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-14/listing-14-5.jpeg"), 
      filename: "listing14-5.jpg"
    )

    puts 'Creating listings 15'
    listing_15 = Listing.create!(
      name: 'Bluff top ocean view home' ,
      description: "Brand New Custom-built Home on the bluffs overlooking the Pacific Ocean, Linda Mar Bay and surfer's beach. Amenities minutes away. Surf and play at the beach with access to stunning hiking trails. Beautiful hardwood flooring, gourmet kitchen w/ huge quartz covered breakfast bar. Plenty of light and views of mountains and Linda Mar Bay. Floor to ceiling windows open to the sounds of the ocean. Spacious master suite has a covered deck to enjoy the panoramic ocean view to the Marin Headlands." ,
      price: 641,
      address: "663 Marina Blvd, San Francisco, CA 94123",
      coordinates: '37.80530568985513 -122.44478332295458',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 6,
      num_of_baths: 3, 
      num_of_bedrooms: 3,
      num_of_beds: 3,
      owner_id: 15
    );

    listing_15.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-15/listing-15-1.jpeg"), 
      filename: "listing15-1.jpg"
    )
    listing_15.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-15/listing-15-2.jpeg"), 
      filename: "listing15-2.jpg"
    )
    listing_15.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-15/listing-15-3.jpeg"), 
      filename: "listing15-3.jpg"
    )
    listing_15.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-15/listing-15-4.jpeg"), 
      filename: "listing15-4.jpg"
    )
    listing_15.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-15/listing-15-5.jpeg"), 
      filename: "listing15-5.jpg"
    )

    listing_16 = Listing.create!(
      name: 'Marbella Lane - Chic Abode w/Mountain Skyline' ,
      description: "Enjoy this luxurious 3-bedroom home with spectacular canyon views. Located in the sought-after Pacifica neighborhood with a modern and sophisticated interior design. This home offers breathtaking sceneries & amazingly beautiful Canyon View. Catch the breathtaking views of the sunrise and sunset on the deck." ,
      price: 379,
      address: "123 Marina Blvd, San Francisco, CA 94123",
      coordinates: '37.80518022363021 -122.43445510047452',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 6,
      num_of_baths: 3, 
      num_of_bedrooms: 3,
      num_of_beds: 3,
      owner_id: 16
    );

    listing_16.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-16/listing-16-1.jpeg"), 
      filename: "listing16-1.jpg"
    )
    listing_16.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-16/listing-16-2.jpeg"), 
      filename: "listing16-2.jpg"
    )
    listing_16.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-16/listign-16-3.jpeg"), 
      filename: "listing16-3.jpg"
    )
    listing_16.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-16/listing-16-4.jpeg"), 
      filename: "listing16-4.jpg"
    )
    listing_16.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-16/listing-16-5.jpeg"), 
      filename: "listing16-5.jpg"
    )

    puts 'Creating listings 17'

    listing_17 = Listing.create!(
      name: 'Bright 2 Bd with Ocean Views. Near GGP, Lands End' ,
      description: "Beautiful, bright 2 bedroom, 1 bath flat with breathtaking Ocean Views. Great location with easy access to nature and public transportation. 2 blocks from Golden Gate park, 4 blocks from great cafes, bakeries, restaurants on the Balboa street corridor. 8 blocks from Ocean Beach and about 10 blocks to Lands End hiking trail, historic Sutro Baths and grocery store. Easy access to public transportation for downtown San Francisco, the Golden Gate Bridge and all parts of San Francisco." ,
      price: 247,
      address: "195 Seal Rock Dr, San Francisco, CA 94121",
      coordinates: '37.780610555499614 -122.50952900033091',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 4,
      num_of_baths: 1, 
      num_of_bedrooms: 2,
      num_of_beds: 2,
      owner_id: 17
    );

    listing_17.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-17/listing-17-1.jpeg"), 
      filename: "listing17-1.jpg"
    )
    listing_17.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-17/listing-17-2.jpeg"), 
      filename: "listing17-2.jpg"
    )
    listing_17.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-17/listing-17-3.jpeg"), 
      filename: "listing17-3.jpg"
    )
    listing_17.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-17/listing-17-4.jpeg"), 
      filename: "listing17-4.jpg"
    )
    listing_17.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-17/listing-17-5.jpeg"), 
      filename: "listing17-5.jpg"
    )

    listing_18 = Listing.create!(
      name: 'NEW! Retreat w/Relaxing Hot Tub Sauna Pool Table!' ,
      description: "This resort like retreat features a relaxing hot tub, outdoor patio seating with firepit, sauna, bbq grill, Olhaussen professional pool table & all the essentials. Watch the dancing flames of the fireplace while enjoying quality time with your friends & family while dining in the great room with the kitchen, dining area, half bath, & family room on the ground floor. The upstairs  features 4 bedrooms, 2 full baths, w/one of them being a primary suite. 20 min to SFO and 25 min to the heart of SF!" ,
      price: 405,
      address: "522 42nd Ave, San Francisco, CA 94121",
      coordinates: '37.77878563942331 -122.50260275550045',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 16,
      num_of_baths: 2, 
      num_of_bedrooms: 4,
      num_of_beds: 6,
      owner_id: 18
    );

    listing_18.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-18/listing-18-1.jpeg"), 
      filename: "listing18-1.jpg"
    )
    listing_18.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-18/listing-18-2.jpeg"), 
      filename: "listing18-2.jpg"
    )
    listing_18.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-18/listing-18-3.jpeg"), 
      filename: "listing18-3.jpg"
    )
    listing_18.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-18/listing-18-4.jpeg"), 
      filename: "listing18-4.jpg"
    )
    listing_18.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-18/listing-18-5.jpeg"), 
      filename: "listing18-5.jpg"
    )

    puts 'Creating listings 19'

    listing_19 = Listing.create!(
      name: 'Hiking, Biking & Bay Area Views!' ,
      description: "This beautiful home in the east bay hills boasts spectacular views of the entire bay area, from San Jose to Marin.  It is a short walk or drive from many miles of trails for hiking, horseback riding and mountain biking.  It also provides immediate access to many miles of the bay area's best road biking on Skyline Boulevard." ,
      price: 385,
      address: "738 46th Ave, San Francisco, CA 94121",
      coordinates: '37.77458482922109 -122.5067221353389',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 8,
      num_of_baths: 2, 
      num_of_bedrooms: 4,
      num_of_beds: 4,
      owner_id: 19
    );

    listing_19.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-19/listing-19-1.jpeg"), 
      filename: "listing19-1.jpg"
    )
    listing_19.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-19/listing-19-2.jpeg"), 
      filename: "listing19-2.jpg"
    )
    listing_19.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-19/listing-19-3.jpeg"), 
      filename: "listing19-3.jpg"
    )
    listing_19.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-19/listing-19-4.jpeg"), 
      filename: "listing19-4.jpg"
    )
    listing_19.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-19/listing-19-5.jpeg"), 
      filename: "listing19-5.jpg"
    )

    puts 'Creating listings 20'

    listing_20 = Listing.create!(
      name: 'San Francisco-Pacifica -Ocean Front French Cottage' ,
      description: "Welcome to this Luxurious & Cozy Beach home with direct Ocean Views -15 Minutes to downtown San Francisco and SFO Airport. Ideal for a relaxing family vacation, romantic or working getaway!! Modern 2 bedroom 2 baths with fully equipped kitchen. Warm and cozy facing the ocean and steps to the Pacifica beach and fishing pier, board walk, Sharp Park and short walk to the historic Sharp Park Golf Course. Plenty of walking trails. Please check out the wonderful reviews from my guests!" ,
      price: 320,
      address: "1580 Great Hwy, San Francisco, CA 94122",
      coordinates: '37.75697771508774 -122.50872872035947',
      amenities: "Wifi Kitchen Beach",
      num_of_guests: 6,
      num_of_baths: 2, 
      num_of_bedrooms: 2,
      num_of_beds: 4,
      owner_id: 20
    );

    listing_20.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-20/listing-20-1.jpeg"), 
      filename: "listing20-1.jpg"
    )
    listing_20.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-20/listing-20-2.jpeg"), 
      filename: "listing20-2.jpg"
    )
    listing_20.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-20/listing-20-3.jpeg"), 
      filename: "listing20-3.jpg"
    )
    listing_20.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-20/listing-20-4.jpeg"), 
      filename: "listing20-4.jpg"
    )
    listing_20.photos.attach(
      io: URI.open("https://nomadbnb-dev.s3.us-west-1.amazonaws.com/listing-20/listing-20-5.jpeg"), 
      filename: "listing20-5.jpg"
    )







    puts "making reviews and resevations"

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2020/07/12",
      check_out_date: "2020/08/13",
      listing_id: 1,
      renter_id: 17,
    );

    Review.create!(
      rating: 4,
      body: "Our stay at this Airbnb was pleasant. The host was friendly and responsive. The apartment was clean and well-equipped. The location was convenient, with easy access to public transportation.",
      listing_id: 1,
      reviewer_id: 17,
      reservation_id: 1
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2020/07/12",
      check_out_date: "2020/08/13",
      listing_id: 1,
      renter_id: 21,
    );

    Review.create!(
      rating: 3,
      body: "The Airbnb had a great location, but the cleanliness was lacking. The host was accommodating and addressed our concerns promptly. Overall, an average experience.",
      listing_id: 1,
      reviewer_id: 21,
      reservation_id:  2
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2021/02/25",
      check_out_date: "2021/09/02",
      listing_id: 1,
      renter_id: 24,
    );

    Review.create!(
      rating: 5,
      body: "Absolutely loved our stay at this Airbnb! The host was incredibly hospitable, and the apartment was beautifully furnished. The view from the balcony was breathtaking. Highly recommended!",
      listing_id: 1,
      reviewer_id: 24,
      reservation_id: 3
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2020/09/30",
      check_out_date: "2020/11/27",
      listing_id: 1,
      renter_id: 23,
    );

    Review.create!(
      rating: 2,
      body: "We were disappointed with this Airbnb. The description didn't match the actual property, and there were maintenance issues. The host was unresponsive, making our experience unsatisfactory.",
      listing_id: 1,
      reviewer_id: 23,
      reservation_id: 4
    )

    puts 'cool'
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2023/04/19",
      check_out_date: "2023/07/28",
      listing_id: 1,
      renter_id: 9,
    );

    Review.create!(
      rating: 4,
      body: "The Airbnb was cozy and had a rustic charm. The host provided clear instructions and was helpful throughout our stay. The only drawback was the limited parking space.",
      listing_id: 1,
      reviewer_id: 9,
      reservation_id: 5
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2023/03/07",
      check_out_date: "2023/05/22",
      listing_id: 2,
      renter_id: 1 ,
    );

    Review.create!(
      rating: 3,
      body: "The location of this Airbnb was excellent, but the apartment itself was small and dated. The host was friendly, but the noise from the neighbors was disruptive.",
      listing_id: 2,
      reviewer_id: 1,
      reservation_id: 6
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/10/04",
      check_out_date: "2022/08/30",
      listing_id: 2,
      renter_id: 17,
    );

    Review.create!(
      rating: 5,
      body:"An exceptional Airbnb experience! The property was immaculate, and the host went above and beyond to ensure our comfort. The amenities exceeded our expectations. We would definitely return!" ,
      listing_id: 2,
      reviewer_id: 17,
      reservation_id: 7
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2020/01/19",
      check_out_date: "2020/08/13",
      listing_id: 2,
      renter_id: 1,
    );

    Review.create!(
      rating: 3,
      body: "This Airbnb had a good location, but the cleanliness could have been better. The host was responsive and provided helpful local tips. Average overall experience.",
      listing_id: 2,
      reviewer_id: 1,
      reservation_id: 8
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2021/09/09",
      check_out_date: "2022/01/22",
      listing_id: 2,
      renter_id: 22,
    );

    puts 'cool 1'

    Review.create!(
      rating: 4,
      body: "We enjoyed our stay at this Airbnb. The apartment was spacious and well-furnished. The host was friendly and accommodating. The only downside was the slow Wi-Fi connection.",
      listing_id: 2,
      reviewer_id: 22,
      reservation_id: 9
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2020/07/12",
      check_out_date: "2020/08/13",
      listing_id: 2,
      renter_id: 15,
    );

    Review.create!(
      rating: 2,
      body: "Our experience at this Airbnb was disappointing. The cleanliness was subpar, and the amenities were lacking. The host was unresponsive to our concerns, making it an unsatisfactory stay.",
      listing_id: 2,
      reviewer_id: 15,
      reservation_id: 10
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2021/11/28",
      check_out_date: "2022/04/23",
      listing_id: 3,
      renter_id: 1,
    );

    Review.create!(
      rating: 5,
      body: "Outstanding Airbnb! The house was stunning, with luxurious amenities. The host was attentive and provided excellent service. It was a truly memorable and enjoyable stay. Highly recommended!",
      listing_id: 3,
      reviewer_id: 1,
      reservation_id: 11
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2020/11/03",
      check_out_date: "2021/08/22",
      listing_id: 3,
      renter_id: 2,
    );

    Review.create!(
      rating: 3,
      body:"The Airbnb had a great location, but the overall condition was average. The host was helpful and friendly. It was a decent place to stay for a short trip." ,
      listing_id: 3,
      reviewer_id: 2,
      reservation_id: 12
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2020/07/12",
      check_out_date: "2020/09/12",
      listing_id: 3,
      renter_id: 20,
    );

    Review.create!(
      rating: 3,
      body: "We had a wonderful time at this Airbnb. The cottage was cozy, and the host was accommodating. The surrounding nature added to the charm. Would consider staying again!",
      listing_id: 3,
      reviewer_id: 20,
      reservation_id: 13
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2021/07/04",
      check_out_date: "2022/04/23",
      listing_id: 3,
      renter_id: 8,
    );

    Review.create!(
      rating: 2,
      body: "Unfortunately, our experience at this Airbnb fell short of expectations. The cleanliness was below par, and the host was unresponsive. Disappointing overall.",
      listing_id: 3,
      reviewer_id: 8,
      reservation_id: 14
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/11/08",
      check_out_date: "2023/02/06",
      listing_id: 3,
      renter_id: 13,
    );

    Review.create!(
      rating: 5,
      body: "This Airbnb was a dream! The location was perfect, and the apartment was beautifully designed. The host was attentive and provided excellent recommendations. We would love to come back!",
      listing_id: 3,
      reviewer_id: 13,
      reservation_id: 15
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/01",
      check_out_date: "2022/12/19",
      listing_id: 4,
      renter_id: 1,
    );

    Review.create!(
      rating: 3,
      body: "The Airbnb had a convenient location, but it lacked proper maintenance. The host was responsive and tried to address our concerns. An average stay overall.",
      listing_id: 4,
      reviewer_id: 1,
      reservation_id: 16
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2021/10/15",
      check_out_date: "2022/01/14",
      listing_id: 4,
      renter_id: 2,
    );

    Review.create!(
      rating: 3,
      body: "Average stay. The apartment was clean, but the furnishings were outdated. The host was responsive, but the noise from the construction nearby was bothersome.",
      listing_id: 4,
      reviewer_id: 2,
      reservation_id: 17
    )

    
    puts 'cool 4'
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2021/07/12",
      check_out_date: "2021/10/09",
      listing_id: 4,
      renter_id: 15,
    );

    Review.create!(
      rating: 4,
      body:  "Enjoyed our time here. The location was convenient, and the host provided helpful recommendations. The only downside was the limited parking availability in the area.",
      listing_id: 4,
      reviewer_id: 15,
      reservation_id: 18
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/01",
      check_out_date: "2022/12/19",
      listing_id: 4,
      renter_id: 22,
    );

    Review.create!(
      rating: 5,
      body:  "Exceptional hospitality! The host was incredibly welcoming and the accommodation exceeded our expectations.",
      listing_id: 4,
      reviewer_id: 22,
      reservation_id: 19
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2021/08/25",
      check_out_date: "2021/11/25",
      listing_id: 4,
      renter_id: 1,
    );

    Review.create!(
      rating: 2,
      body:  "Disappointing stay. The property was not as described, and the host was unresponsive to our complaints.",
      listing_id: 4,
      reviewer_id: 21,
      reservation_id: 20
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2021/09/03",
      check_out_date: "2021/12/01",
      listing_id: 5,
      renter_id: 1,
    );

    Review.create!(
      rating: 2,
      body:  "Disappointing stay. The property was not as described, and the host was unresponsive to our complaints.",
      listing_id: 5,
      reviewer_id: 1,
      reservation_id: 21
    )

    puts 'cool 6'

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2021/07/12", 
      check_out_date: "2021/10/09",
      listing_id: 5,
      renter_id: 2,
    );

    
    Review.create!(
      rating: 3, body: "Average stay. The apartment was clean, but the furnishings were outdated. The host was responsive, but the noise from the construction nearby was bothersome.",
      listing_id: 5,
      reviewer_id: 2,
      reservation_id: 22
    )


    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2021/08/25", check_out_date: "2021/11/25" ,
      listing_id: 5,
      renter_id: 27,
    );

    Review.create!(
      rating: 4, body: "Enjoyed our time here. The location was convenient, and the host provided helpful recommendations. The only downside was the limited parking availability in the area.",
      listing_id: 5,
      reviewer_id: 27,
      reservation_id: 23
    )


    puts 'cool 5'

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2021/09/03", check_out_date: "2021/12/01",
      listing_id: 5,
      renter_id: 23,
    );

    Review.create!(
      rating: 5, body: "An unforgettable experience! The host was exceptional, going above and beyond to ensure our comfort. The apartment was spacious, clean, and had breathtaking views.",
      listing_id: 5,
      reviewer_id: 23,
      reservation_id: 24
    )


    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2021/10/07", check_out_date: "2022/01/07",
      listing_id: 5,
      renter_id: 22,
    );

    Review.create!(
      rating: 2, body: "Disappointing stay. The photos were misleading, and the actual apartment was smaller and poorly maintained. The host was unresponsive to our concerns." ,
      listing_id: 5,
      reviewer_id: 22,
      reservation_id: 25
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2021/11/09", check_out_date: "2022/02/09",
      listing_id: 6,
      renter_id: 1,
    );

    Review.create!(
      rating: 4, body: "Great value for the price. The apartment had all the necessary amenities and the host was helpful.",
      listing_id: 6,
      reviewer_id: 1,
      reservation_id: 26
    )


    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2021/12/22", check_out_date: "2022/03/22" ,
      listing_id: 6,
      renter_id: 27,
    );

    Review.create!(
      rating: 4, body: "Great value for the price. The apartment had all the necessary amenities and the host was helpful.",
      listing_id: 6,
      reviewer_id: 27,
      reservation_id: 27
    )


    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/01/16", check_out_date: "2022/06/16",
      listing_id: 6,
      renter_id: 11,
    );

    Review.create!(
      rating: 4, body: "Great value for the price. The apartment had all the necessary amenities and the host was helpful.",
      listing_id: 6,
      reviewer_id: 11,
      reservation_id: 28
    )


    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/02/18", check_out_date: "2022/05/18" ,
      listing_id: 6,
      renter_id: 6,
    );

    Review.create!(
      rating: 4, body: "Great value for the price. The apartment had all the necessary amenities and the host was helpful.",
      listing_id: 6,
      reviewer_id: 6,
      reservation_id: 29
    )

    puts 'cool 8'


    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/03/10", check_out_date: "2022/06/10",
      listing_id: 6,
      renter_id: 21,
    );

    Review.create!(
      rating: 4, body: "Great value for the price. The apartment had all the necessary amenities and the host was helpful.",
      listing_id: 6,
      reviewer_id: 12,
      reservation_id: 30
    )


    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/04/29", check_out_date: "2022/07/29",
      listing_id: 7,
      renter_id: 1,
    );

    Review.create!(
      rating: 3, body: "Decent accommodation. The location was good, but the noise from the neighbors was a bit disruptive.", 
      listing_id: 7,
      reviewer_id: 1,
      reservation_id: 31
    )


    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 7,
      renter_id: 4,
    );

    Review.create!(
      rating: 4, body: "Enjoyed our stay. The host was friendly and accommodating. The apartment was clean and comfortable, although the Wi-Fi signal was weak at times." ,
      listing_id: 7,
      reviewer_id: 24,
      reservation_id: 32
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 7,
      renter_id: 27,
    );

    Review.create!(
      rating: 5, body: "Absolutely loved it! The host was friendly, and the apartment was clean, comfortable, and beautifully decorated." ,
      listing_id: 7,
      reviewer_id: 27,
      reservation_id: 33
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 7,
      renter_id: 12,
    );

    Review.create!(
      rating: 4, body: "Good experience overall. The host provided clear instructions, and the apartment had a nice view." ,
      listing_id: 7,
      reviewer_id: 12,
      reservation_id: 34
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 7,
      renter_id: 13,
    );

    Review.create!(
      rating: 5, body: "Outstanding stay! The property exceeded our expectations, and the host was incredibly accommodating.",
      listing_id: 7,
      reviewer_id: 13,
      reservation_id: 35
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 8,
      renter_id: 1,
    );

    Review.create!(
      rating: 2, body: "Not up to par. The apartment was poorly maintained and lacked basic amenities. The host was unresponsive to our concerns.",
      listing_id: 8,
      reviewer_id: 1,
      reservation_id: 36
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 8,
      renter_id: 18,
    );

    Review.create!(
      rating: 5, body: "Fantastic stay! The host was welcoming, and the apartment was clean, spacious, and had a great location.",
      listing_id: 8,
      reviewer_id: 18,
      reservation_id: 37
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 8,
      renter_id: 8,
    );

    Review.create!(
      rating: 3, body: "Average accommodation. The apartment was clean, but the furniture was outdated. The host was responsive, but the noise from the neighbors was bothersome at times.",
      listing_id: 8,
      reviewer_id: 8,
      reservation_id: 38
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 8,
      renter_id: 14,
    );

    Review.create!(
      rating: 4, body: "Good experience overall. The host was friendly and provided useful tips for exploring the city. The apartment was comfortable, although the bathroom could have been cleaner.",
      listing_id: 8,
      reviewer_id: 14,
      reservation_id: 39
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 8,
      renter_id: 22,
    );

    Review.create!(
      rating: 2, body: "Below expectations. The photos were misleading, and the actual apartment was smaller and in need of maintenance. The host was unresponsive to our inquiries." ,
      listing_id: 8,
      reviewer_id: 22,
      reservation_id: 40
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 9,
      renter_id: 1,
    );

    Review.create!(
      rating: 4, body: "Great value for the price. The apartment had a convenient location and comfortable beds. The host was helpful and provided prompt communication throughout our stay.",
      listing_id: 9,
      reviewer_id: 1,
      reservation_id: 41
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 9,
      renter_id: 26,
    );

    Review.create!(
      rating: 4, body: "Great value for the price. The apartment had a convenient location and comfortable beds. The host was helpful and provided prompt communication throughout our stay.",
      listing_id: 9,
      reviewer_id: 26,
      reservation_id: 42
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 9,
      renter_id: 2,
    );

    Review.create!(
      rating: 5, body: "Absolutely loved it! The host was warm and welcoming, and the apartment was clean, spacious, and beautifully designed. Would definitely stay here again in the future.",
      listing_id: 9,
      reviewer_id: 2,
      reservation_id: 43
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 9,
      renter_id: 15,
    );

    Review.create!(
      rating: 3, body: "Decent stay. The apartment had a good location, but the noise from the nearby construction was disruptive. The host was responsive to our needs.",
      listing_id: 9,
      reviewer_id: 15,
      reservation_id: 44
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 9,
      renter_id: 19,
    );

    Review.create!(
      rating: 5, body: "A wonderful experience! The host was attentive and provided excellent recommendations for local attractions. The apartment was immaculate and had stunning views.",
      listing_id: 9,
      reviewer_id: 19,
      reservation_id: 45
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 10,
      renter_id: 1,
    );

    Review.create!(
      rating: 4, body: "Enjoyable stay. The host was friendly and accommodating. The apartment was clean and comfortable, although the kitchen could have been better equipped." ,
      listing_id: 10,
      reviewer_id: 1,
      reservation_id: 46
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 10,
      renter_id: 23,
    );

    Review.create!(
      rating: 4, body: "Enjoyable stay. The host was friendly and accommodating. The apartment was clean and comfortable, although the kitchen could have been better equipped." ,
      listing_id: 10,
      reviewer_id: 23,
      reservation_id: 47
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 10,
      renter_id: 27,
    );

    Review.create!(
      rating: 1, body: "Awful experience. The apartment was dirty and smelled bad. The host was unresponsive and did not address our complaints." ,
      listing_id: 10,
      reviewer_id: 27,
      reservation_id: 48
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 10,
      renter_id: 25,
    );

    Review.create!(
      rating: 5, body: "Exceptional stay! The host was amazing and provided outstanding hospitality. The apartment was clean, spacious, and had a great location." ,
      listing_id: 10,
      reviewer_id: 25,
      reservation_id: 49
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 10,
      renter_id: 22,
    );

    Review.create!(
      rating: 2, body: "Disappointing stay. The apartment was not as described, and the host was unhelpful. Would not recommend.",
      listing_id: 4,
      reviewer_id: 22,
      reservation_id: 50
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 11,
      renter_id: 1,
    );

    Review.create!(
      rating: 3, body: "Decent stay. The apartment was clean, but the noise from the street was bothersome. The host was responsive, but could have been more helpful.",
      listing_id: 11,
      reviewer_id: 1,
      reservation_id: 51
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 11,
      renter_id: 7,
    );


    Review.create!(
      rating: 3, body: "Decent stay. The apartment was clean, but the noise from the street was bothersome. The host was responsive, but could have been more helpful.",
      listing_id: 11,
      reviewer_id: 7,
      reservation_id: 52
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 11,
      renter_id: 16,
    );

    Review.create!(
      rating: 3, body: "Decent stay. The apartment was clean, but the noise from the street was bothersome. The host was responsive, but could have been more helpful.",
      listing_id: 11,
      reviewer_id: 16,
      reservation_id: 53
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 11,
      renter_id: 4,
    );

    Review.create!(
      rating: 3, body: "Decent stay. The apartment was clean, but the noise from the street was bothersome. The host was responsive, but could have been more helpful.",
      listing_id: 11,
      reviewer_id: 4,
      reservation_id: 54
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 11,
      renter_id: 20,
    );

    Review.create!(
      rating: 3, body: "Decent stay. The apartment was clean, but the noise from the street was bothersome. The host was responsive, but could have been more helpful.",
      listing_id: 11,
      reviewer_id: 20,
      reservation_id: 55
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 12,
      renter_id: 1,
    );

    Review.create!(
      rating: 5, body: "An amazing experience! The host was attentive and helpful, and the apartment was beautifully decorated and had breathtaking views. Would definitely stay here again!",
      listing_id: 12,
      reviewer_id: 1,
      reservation_id: 56
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 12,
      renter_id: 22,
    );

    Review.create!(
      rating: 2, body: "Not recommended. The apartment was not clean upon arrival, and the host was unresponsive to our concerns. Overall, the experience was disappointing and frustrating.",
      listing_id: 12,
      reviewer_id: 22,
      reservation_id: 57
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 12,
      renter_id: 24,
    );

    Review.create!(
      rating: 4, body: "Good value for the price. The apartment was clean and had all the necessary amenities. The host was friendly and provided helpful local tips.",
      listing_id: 12,
      reviewer_id: 24,
      reservation_id: 58
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 12,
      renter_id: 12,
    );

    Review.create!(
      rating: 5, body: "Highly recommend this place! The host was fantastic, providing excellent recommendations for local attractions. The apartment was clean, comfortable, and beautifully decorated.",
      listing_id: 12,
      reviewer_id: 12,
      reservation_id: 59
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 12,
      renter_id: 17,
    );

    Review.create!(
      rating: 3, body: "Average stay. The apartment was clean, but the furnishings were outdated. The host was responsive, but the noise from the construction nearby was bothersome.",
      listing_id: 12,
      reviewer_id: 17,
      reservation_id: 60
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 13,
      renter_id: 1,
    );

    Review.create!(
      rating: 4, body: "Enjoyed our time here. The location was convenient, and the host provided helpful recommendations. The only downside was the limited parking availability in the area.",
      listing_id: 13,
      reviewer_id: 1,
      reservation_id: 61
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 13,
      renter_id: 27,
    );

    Review.create!(
      rating: 4, body: "Enjoyed our time here. The location was convenient, and the host provided helpful recommendations. The only downside was the limited parking availability in the area.",
      listing_id: 13,
      reviewer_id: 27,
      reservation_id: 62
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 13,
      renter_id: 11,
    );

    Review.create!(
      rating: 4, body: "Enjoyed our time here. The location was convenient, and the host provided helpful recommendations. The only downside was the limited parking availability in the area.",
      listing_id: 13,
      reviewer_id: 11,
      reservation_id: 63
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 2,
      renter_id: 1,
    );

    Review.create!(
      rating: 4, body: "Enjoyed our time here. The location was convenient, and the host provided helpful recommendations. The only downside was the limited parking availability in the area.",
      listing_id: 13,
      reviewer_id: 2,
      reservation_id: 64
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 13,
      renter_id: 5,
    );

    Review.create!(
      rating: 4, body: "Enjoyed our time here. The location was convenient, and the host provided helpful recommendations. The only downside was the limited parking availability in the area.",
      listing_id: 13,
      reviewer_id: 5,
      reservation_id: 65
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 14,
      renter_id: 1,
    );

    Review.create!(
      rating: 5, body: "An unforgettable experience! The host was exceptional, going above and beyond to ensure our comfort. The apartment was spacious, clean, and had breathtaking views.",
      listing_id: 14,
      reviewer_id: 1,
      reservation_id: 66
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 14,
      renter_id: 24,
    );

    Review.create!(
      rating: 2, body: "Disappointing stay. The photos were misleading, and the actual apartment was smaller and poorly maintained. The host was unresponsive to our concerns.",
      listing_id: 14,
      reviewer_id: 24,
      reservation_id: 67
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 14,
      renter_id: 16,
    );

    Review.create!(
      rating: 2, body: "Disappointing stay. The photos were misleading, and the actual apartment was smaller and poorly maintained. The host was unresponsive to our concerns.",
      listing_id: 14,
      reviewer_id: 16,
      reservation_id: 68
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 14,
      renter_id: 2,
    );

    Review.create!(
      rating: 2, body: "Disappointing stay. The photos were misleading, and the actual apartment was smaller and poorly maintained. The host was unresponsive to our concerns.",
      listing_id: 14,
      reviewer_id: 2,
      reservation_id: 69
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 14,
      renter_id: 3,
    );

    Review.create!(
      rating: 2, body: "Disappointing stay. The photos were misleading, and the actual apartment was smaller and poorly maintained. The host was unresponsive to our concerns.",
      listing_id: 14,
      reviewer_id: 3,
      reservation_id: 70
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 15,
      renter_id: 1,
    );

    Review.create!(
      rating: 4, body: "Great value for the price. The apartment had all the necessary amenities and the host was helpful." ,
      listing_id: 15,
      reviewer_id: 1,
      reservation_id: 71
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 15,
      renter_id: 3,
    );

    Review.create!(
      rating: 3, body: "Decent accommodation. The location was good, but the noise from the neighbors was a bit disruptive.",
      listing_id: 15,
      reviewer_id: 3,
      reservation_id: 72
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 15,
      renter_id: 5,
    );

    Review.create!(
      rating: 5, body: "Absolutely loved it! The host was friendly, and the apartment was clean, comfortable, and beautifully decorated.",
      listing_id: 15,
      reviewer_id: 5,
      reservation_id: 73
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 15,
      renter_id: 6,
    );

    Review.create!(
      rating: 4, body: "Good experience overall. The host provided clear instructions, and the apartment had a nice view.",
      listing_id: 15,
      reviewer_id: 6,
      reservation_id: 74
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 15,
      renter_id: 13,
    );

    Review.create!(
      rating: 5, body: "Outstanding stay! The property exceeded our expectations, and the host was incredibly accommodating.",
      listing_id: 15,
      reviewer_id: 13,
      reservation_id: 75
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 16,
      renter_id: 1,
    );

    Review.create!(
      rating: 2, body: "Not up to par. The apartment was poorly maintained and lacked basic amenities. The host was unresponsive to our concerns." ,
      listing_id: 16,
      reviewer_id: 1,
      reservation_id: 76
    )

    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 16,
      renter_id: 14,
    );

    Review.create!(
      rating: 5, body: "Fantastic stay! The host was welcoming, and the apartment was clean, spacious, and had a great location." ,
      listing_id: 16,
      reviewer_id: 14,
      reservation_id: 77
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 16,
      renter_id: 8,
    );

    Review.create!(
      rating: 5, body: "Fantastic stay! The host was welcoming, and the apartment was clean, spacious, and had a great location." ,
      listing_id: 16,
      reviewer_id: 8,
      reservation_id: 78
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 16,
      renter_id: 19,
    );

    Review.create!(
      rating: 5, body: "Fantastic stay! The host was welcoming, and the apartment was clean, spacious, and had a great location." ,
      listing_id: 16,
      reviewer_id: 19,
      reservation_id: 79
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 16,
      renter_id: 25,
    );

    Review.create!(
      rating: 5, body: "Fantastic stay! The host was welcoming, and the apartment was clean, spacious, and had a great location." ,
      listing_id: 16,
      reviewer_id: 25,
      reservation_id: 80
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 17,
      renter_id: 1,
    );

    Review.create!(
      rating: 5, body: "Fantastic stay! The host was welcoming, and the apartment was clean, spacious, and had a great location." ,
      listing_id: 17,
      reviewer_id: 1,
      reservation_id: 81
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 17,
      renter_id: 7,
    );

    Review.create!(
      rating: 3, body: "Average accommodation. The apartment was clean, but the furniture was outdated. The host was responsive, but the noise from the neighbors was bothersome at times.",
      listing_id: 17,
      reviewer_id: 7,
      reservation_id: 82
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 17,
      renter_id: 10,
    );

    Review.create!(
      rating: 4, body: "Good experience overall. The host was friendly and provided useful tips for exploring the city. The apartment was comfortable, although the bathroom could have been cleaner." ,
      listing_id: 17,
      reviewer_id: 10,
      reservation_id: 83
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 17,
      renter_id: 24,
    );

    Review.create!(
      rating: 2, body: "Below expectations. The photos were misleading, and the actual apartment was smaller and in need of maintenance. The host was unresponsive to our inquiries.",
      listing_id: 17,
      reviewer_id: 24,
      reservation_id: 84
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 17,
      renter_id: 18,
    );

    Review.create!(
      rating: 4, body: "Great value for the price. The apartment had a convenient location and comfortable beds. The host was helpful and provided prompt communication throughout our stay." ,
      listing_id: 17,
      reviewer_id: 18,
      reservation_id: 85
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 18,
      renter_id: 1,
    );

    Review.create!(
      rating: 5, body: "Absolutely loved it! The host was warm and welcoming, and the apartment was clean, spacious, and beautifully designed. Would definitely stay here again in the future.",
      listing_id: 18,
      reviewer_id: 1,
      reservation_id: 86
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 18,
      renter_id: 12,
    );

    Review.create!(
      rating: 3, body: "Decent stay. The apartment had a good location, but the noise from the nearby construction was disruptive. The host was responsive to our needs.",
      listing_id: 18,
      reviewer_id: 12,
      reservation_id: 87
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 18,
      renter_id: 4,
    );

    Review.create!(
      rating: 3, body: "Decent stay. The apartment had a good location, but the noise from the nearby construction was disruptive. The host was responsive to our needs.",
      listing_id: 18,
      reviewer_id: 4,
      reservation_id: 88
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 18,
      renter_id: 26,
    );

    Review.create!(
      rating: 5, body: "A wonderful experience! The host was attentive and provided excellent recommendations for local attractions. The apartment was immaculate and had stunning views." ,
      listing_id: 18,
      reviewer_id: 26,
      reservation_id: 89
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 18,
      renter_id: 17,
    );

    Review.create!(
      rating: 4, body: "Enjoyable stay. The host was friendly and accommodating. The apartment was clean and comfortable, although the kitchen could have been better equipped." ,
      listing_id: 18,
      reviewer_id: 17,
      reservation_id: 90
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 19,
      renter_id: 1,
    );

    Review.create!(
      rating: 1, body: "Awful experience. The apartment was dirty and smelled bad. The host was unresponsive and did not address our complaints." ,
      listing_id: 19,
      reviewer_id: 1,
      reservation_id: 91
    )
    
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 19,
      renter_id: 12,
    );

    Review.create!(
      rating: 1, body: "Awful experience. The apartment was dirty and smelled bad. The host was unresponsive and did not address our complaints." ,
      listing_id: 19,
      reviewer_id: 12,
      reservation_id: 92
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 19,
      renter_id: 27,
    );

    Review.create!(
      rating: 1, body: "Awful experience. The apartment was dirty and smelled bad. The host was unresponsive and did not address our complaints." ,
      listing_id: 19,
      reviewer_id: 27,
      reservation_id: 93
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 19,
      renter_id: 23,
    );

    Review.create!(
      rating: 1, body: "Awful experience. The apartment was dirty and smelled bad. The host was unresponsive and did not address our complaints." ,
      listing_id: 19,
      reviewer_id: 23,
      reservation_id: 94
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 19,
      renter_id: 16,
    );

    Review.create!(
      rating: 1, body: "Awful experience. The apartment was dirty and smelled bad. The host was unresponsive and did not address our complaints." ,
      listing_id: 19,
      reviewer_id: 16,
      reservation_id: 95
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 20,
      renter_id: 1,
    );

    Review.create!(
      rating: 5, body: "Exceptional stay! The host was amazing and provided outstanding hospitality. The apartment was clean, spacious, and had a great location.",
      listing_id: 20,
      reviewer_id: 16,
      reservation_id: 96
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 20,
      renter_id: 16,
    );

    Review.create!(
      rating: 2, body: "Disappointing stay. The apartment was not as described, and the host was unhelpful. Would not recommend.",
      listing_id: 20,
      reviewer_id: 16,
      reservation_id: 97
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 20,
      renter_id: 14,
    );

    Review.create!(
      rating: 4, body: "Great location and comfortable stay. The host was responsive and provided helpful recommendations for local attractions. Would consider staying here again in the future." ,
      listing_id: 20,
      reviewer_id: 14,
      reservation_id: 98
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 20,
      renter_id: 12,
    );

    Review.create!(
      rating: 3, body: "Decent stay. The apartment was clean, but the noise from the street was bothersome. The host was responsive, but could have been more helpful." ,
      listing_id: 20,
      reviewer_id: 12,
      reservation_id: 99
    )
    
    Reservation.create!(
      num_of_guests: 2,
      check_in_date: "2022/05/11", check_out_date: "2022/08/11" ,
      listing_id: 20,
      renter_id: 14,
    );

    Review.create!(
      rating: 5, body: "Highly recommended! The host was exceptional, providing great recommendations for local attractions. The apartment was clean, modern, and had a great location.",
      listing_id: 20,
      reviewer_id: 14,
      reservation_id: 100
    )

    

    puts "Done!"
