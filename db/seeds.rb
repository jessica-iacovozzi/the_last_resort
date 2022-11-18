# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require "open-uri"

# User seeds
puts "Cleaning database..."
Booking.destroy_all
User.destroy_all

puts "Creating users..."
@hugo = { first_name: 'Hugo',
          last_name: 'Dulac',
          address: 'Hochelaga',
          email: 'hd@gmail.com',
          password: '123456',
          avatar: 'https://res.cloudinary.com/dppymdnxh/image/upload/v1668617350/spell%20images/users/03-steve_uaz0jx.jpg' }
@jessica = { first_name: 'Jessica',
             last_name: 'Iacovozzi',
             address: 'Lasalle',
             email: 'ji@gmail.com',
             password: '123456',
             avatar: 'https://res.cloudinary.com/dppymdnxh/image/upload/v1668617351/spell%20images/users/09-angela_wj9jud.jpg' }
@giovanni = { first_name: 'Giovanni',
              last_name: 'Reid',
              address: 'Rockland',
              email: 'gr@gmail.com',
              password: '123456',
              avatar: 'https://res.cloudinary.com/dppymdnxh/image/upload/v1668617350/spell%20images/users/01-dimitri_gjcpcp.jpg' }
@eva = { first_name: 'Eva',
         last_name: 'Roux',
         address: 'Plateau',
         email: 'er@gmail.com',
         password: '123456',
         avatar: 'https://res.cloudinary.com/dppymdnxh/image/upload/v1668617350/spell%20images/users/02-tanya_ilefnh.jpg' }

[@hugo, @jessica, @giovanni, @eva].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.first_name}"
end
puts "Done!"

# Spell seeds
Spell.destroy_all

puts "Creating spells..."
love_bond = { name: "Love Bond",
              user: @hugo.id,
              description: "Make someone fall in love with you",
              location: "92230, Gennevilliers, Hauts-de-Seine, France",
              category: "Love",
              price: "95" }
cook_well = { name: "Cook Well",
              user: @giovanni,
              description: "Bring out the best taste in you dish, everytime",
              location: "8787 Woodbine Avenue, Markham, Ontario L3R 0P4, Canada",
              price: "65",
              category: "Home" }
disable_stalker = { name: "Disable Stalker",
                    user: @eva,
                    description: "Any stalker who starts following you will suddenly get injured",
                    location: "744 High Street, Kew East Victoria 3102, Australia",
                    price: "110",
                    category: "Social" }
block_mother_in_law = { name: "Block Mother In Law",
                        user: @hugo,
                        description: "Any call from your mother in law will be mysteriously  redirected",
                        location: "900 Parish Loop, Hinesville, Georgia 31313, United States",
                        category: "Family",
                        price: "45" }
always_clean = { name: "Always Clean",
                 user: @jessica,
                 description: "Every rooms in your home clean themselves",
                 location: "5454 Toronto Road, Haverhill, Florida 33415, United States",
                 category: "Home",
                 price: "45" }
upgrade_car = { name: "Upgrade Your Car",
                user: @giovanni,
                description: "Everyone will perceive your car as a Maserati",
                location: "Steinbruchbrücke 0987, 2380 Liesing, Austria",
                category: "Social",
                price: "450" }
last_longer = { name: "Last longer",
                user: @giovanni,
                description: "... You know what I'm talking about",
                location: "6969 Chemin Montauban, Saint-Damien, Quebec J0K 2E0, Canada",
                category: "Self",
                price: "100" }
upgrade_my_css = { name: "Upgrade my CSS",
                   user: @eva,
                   description: "No matter your skill level, your CSS code will be amazing",
                   location: "29793, Torrox, Málaga, Spain",
                   category: "Self",
                   price: "1000" }
change_height = { name: "Change my height",
                  user: @jessica,
                  description: "Choose whatever height you want to be",
                  location: "34345, Daedeok-gu, Daejeon, South Korea",
                  category: "Self",
                  price: "1000" }
background_img = [
  'https://res.cloudinary.com/dppymdnxh/image/upload/v1668616924/spell%20images/vera-velichko-potions-poison-skull-wallpaper_vornxb.jpg',
  'https://res.cloudinary.com/dppymdnxh/image/upload/v1668617000/spell%20images/2306148a6826c3849554ff6e82f358c0_tm8orh.jpg',
  'https://res.cloudinary.com/dppymdnxh/image/upload/v1668616976/spell%20images/bdf4e8e60c1fedae47811e60754532c1_hnmf8b.png'
]
[love_bond, cook_well, disable_stalker, block_mother_in_law, always_clean, upgrade_car, last_longer, upgrade_my_css, change_height].each do |attributes|
  spell = Spell.create!(attributes)
  puts "Created #{spell.name}"
  file = URI.open(background_img.sample)
  spell.photo.attach(io: file, filename: "spell1.jpeg", content_type: 'image/png')
  spell.save
end
puts "Finished!"

# Booking seeds
puts "Cleaning database..."

puts "Creating bookings..."
@bookings = [{ start_date: Date.new(2022, 11, 20),
               end_date: Date.new(2022, 11, 24),
               user: User.all.sample,
               spell: Spell.all.sample },
             { start_date: Date.new(2022, 11, 19),
               end_date: Date.new(2022, 11, 23),
               user: User.all.sample,
               spell: Spell.all.sample },
             { start_date: Date.new(2022, 11, 20),
               end_date: Date.new(2022, 11, 27),
               user: User.all.sample,
               spell: Spell.all.sample },
             { start_date: Date.new(2022, 11, 23),
               end_date: Date.new(2022, 11, 27),
               user: User.all.sample,
               spell: Spell.all.sample }]

@bookings.each do |attributes|
  booking = Booking.create!(attributes)
  puts "Created booking ##{booking.id}"
end
puts "All done!"
