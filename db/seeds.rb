# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
User.destroy_all

puts "Creating users..."
hugo = { first_name: 'Hugo', last_name: 'Dulac', address: 'Hochelaga', email: 'hd@gmail.com', password: '123456' }
jessica = { first_name: 'Jessica', last_name: 'Iacovozzi', address: 'Lasalle', email: 'ji@gmail.com', password: '123456' }
giovanni = { first_name: 'Giovanni', last_name: 'Reid', address: 'Rockland', email: 'gr@gmail.com', password: '123456' }
eva = { first_name: 'Eva', last_name: 'Roux', address: 'Plateau', email: 'er@gmail.com', password: '123456' }

[hugo, jessica, giovanni, eva].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.first_name}"
end
puts "Done!"
