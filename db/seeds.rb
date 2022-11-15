# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#puts "Cleaning database..."
Spell.destroy_all

puts "Creating spells..."
love_bond = { name: "Love Bond",
              description: "Make someone fall in love with you",
              location: "Villeray", rating: "5",
              category: "Love",
              price: "95" }
cook_well = { name: "Cook Well", description: "Bring out the best taste in you dish, everytime", location: "Plateau",
              rating: "4", price: "65",
              category: "Home" }
disable_stalker = { name: "Disable Stalker",
                    description: "Any stalker who starts following you will suddenly get injured",
                    location: "Montreal", rating: "4", price: "110", category: "Social" }
block_mother_in_law = { name: "Disable Stalker",
                        description: "Any call from your mother in law will be mysteriously  redirected",
                        location: "Village",
                        category: "Family",
                        rating: "5",
                        price: "45" }
always_clean = { name: "Always Clean",
                 description: "Every rooms in your home clean themselves",
                 location: "Mile-End",
                 category: "Home",
                 rating: "5",
                 price: "45" }
[love_bond, cook_well, disable_stalker, block_mother_in_law, always_clean].each do |attributes|
  spell = Spell.create!(attributes)
  puts "Created #{spell.name}"
end
puts "Finished!"
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
