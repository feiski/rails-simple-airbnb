# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
5.times do |i|
  flat = Flat.new(
    name: Faker::Address.unique.community,
    address: Faker::Address.unique.full_address,
    description: Faker::Lorem.paragraph,
    price_per_night: Faker::Number.between(from: 50, to: 200),
    number_of_guests: Faker::Number.between(from: 1, to: 5)
  )
  if flat.save
    puts "Flat #{i+1} created successfully!"
  else
    puts "Error creating Flat #{i+1}: #{flat.errors.full_messages.join(', ')}"
  end
end
