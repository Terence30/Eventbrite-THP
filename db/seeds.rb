# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users') #commande pour reset l'id 

10.times do
	u = User.new(description: Faker::TvShows::GameOfThrones.quote, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
    u.email = u.last_name + "@yopmail.com"
    u.save
end
puts "User created"