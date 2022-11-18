# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require "open-uri"

# User seeds
puts "Cleaning database..."
Booking.destroy_all
User.destroy_all

puts "Creating users..."
hugo = { first_name: 'Hugo',
         last_name: 'Dulac',
         address: 'Hochelaga',
         email: 'hd@gmail.com',
         password: '123456',
         avatar: 'https://res.cloudinary.com/dppymdnxh/image/upload/v1668617350/spell%20images/users/03-steve_uaz0jx.jpg' }
jessica = { first_name: 'Jessica',
            last_name: 'Iacovozzi',
            address: 'Lasalle',
            email: 'ji@gmail.com',
            password: '123456',
            avatar: 'https://res.cloudinary.com/dppymdnxh/image/upload/v1668617351/spell%20images/users/09-angela_wj9jud.jpg' }
giovanni = { first_name: 'Giovanni',
             last_name: 'Reid',
             address: 'Rockland',
             email: 'gr@gmail.com',
             password: '123456',
             avatar: 'https://res.cloudinary.com/dppymdnxh/image/upload/v1668617350/spell%20images/users/01-dimitri_gjcpcp.jpg' }
eva = { first_name: 'Eva',
        last_name: 'Roux',
        address: 'Plateau',
        email: 'er@gmail.com',
        password: '123456',
        avatar: 'https://res.cloudinary.com/dppymdnxh/image/upload/v1668617350/spell%20images/users/02-tanya_ilefnh.jpg' }

[hugo, jessica, giovanni, eva].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.first_name}"
end
puts "Done!"

# Spell seeds
Spell.destroy_all

puts "Creating spells..."
love_bond = { name: "Love Bond",
              user: User.all.sample,
              description: "Make someone fall in love with you",
              location: "3562 Rue Charles Goulet, Montreal",
              category: "Love",
              price: "95" }
cook_well = { name: "Cook Well",
              user: User.all.sample,
              description: "Bring out the best taste in you dish, everytime",
              location: "983 Rue Jean-Carignan, Montreal",
              price: "65",
              category: "Home" }
disable_stalker = { name: "Disable Stalker",
                    user: User.all.sample,
                    description: "Any stalker who starts following you will suddenly get injured",
                    location: "9833 Rue Huot, Montreal",
                    price: "110",
                    category: "Social" }
block_mother_in_law = { name: "Block Mother In Law",
                        user: User.all.sample,
                        description: "Any call from your mother in law will be mysteriously  redirected",
                        location: "543 Rue Gounod, Montreal",
                        category: "Family",
                        price: "45" }
always_clean = { name: "Always Clean",
                 user: User.all.sample,
                 description: "Every rooms in your home clean themselves",
                 location: "876 Rue Gilford, Montreal",
                 category: "Home",
                 price: "45" }
upgrade_car = { name: "Upgrade Your Car",
                user: User.all.sample,
                description: "Everyone will perceive your car as a Maserati",
                location: "3278 Avenue Cedar, Westmount",
                category: "Social",
                price: "450" }
last_longer = { name: "Last longer",
                user: User.all.sample,
                description: "... You know what I'm talking about",
                location: "9876 Rue De Teck, Montreal",
                category: "Self",
                price: "100" }
upgrade_my_css = { name: "Upgrade my CSS",
                   user: User.all.sample,
                   description: "No matter your skill level, your CSS code will be amazing",
                   location: "321 Rue Bousquet, Montreal",
                   category: "Self",
                   price: "1000" }
change_height = { name: "Change my height",
                  user: User.all.sample,
                  description: "Choose whatever height you want to be",
                  location: "9090 Rue Jolicoeur, Montreal",
                  category: "Self",
                  price: "25" }
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
@bookings = [{ start_date: Date.new(2022, 11, 19),
               end_date: Date.new(2022, 11, 20),
               user: User.all.sample,
               spell: Spell.all.sample },
             { start_date: Date.new(2022, 11, 21),
               end_date: Date.new(2022, 11, 25),
               user: User.all.sample,
               spell: Spell.all.sample },
             { start_date: Date.new(2022, 11, 29),
               end_date: Date.new(2022, 11, 30),
               user: User.all.sample,
               spell: Spell.all.sample },
             { start_date: Date.new(2022, 12, 10),
               end_date: Date.new(2022, 12, 15),
               user: User.all.sample,
               spell: Spell.all.sample },
             { start_date: Date.new(2022, 12, 16),
               end_date: Date.new(2022, 12, 17),
               user: User.all.sample,
               spell: Spell.all.sample },
             { start_date: Date.new(2022, 12, 19),
               end_date: Date.new(2022, 12, 21),
               user: User.all.sample,
               spell: Spell.all.sample },
             { start_date: Date.new(2022, 12, 24),
               end_date: Date.new(2022, 12, 25),
               user: User.all.sample,
               spell: Spell.all.sample },
             { start_date: Date.new(2022, 12, 30),
               end_date: Date.new(2022, 12, 31),
               user: User.all.sample,
               spell: Spell.all.sample }]

@bookings.each do |attributes|
  booking = Booking.create!(attributes)
  puts "Created booking ##{booking.id}"
end
puts "All done!"
