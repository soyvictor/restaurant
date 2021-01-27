# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Item.destroy_all if Rails.env.development?
Category.destroy_all if Rails.env.development?

puts 'Creating categories...'
torta = Category.create!(name: 'torta', user: User.first)
bebida = Category.create!(name: 'bebida', user: User.first)

puts 'Creating items...'
Item.create!(category: torta, name: 'torta de pierna', description: 'Orden de 4 tacos en tortillas de maíz', user: User.first)
Item.create!(category: bebida, name: 'coca cola', description: 'A popular and nice refreshing soda', user: User.first)

puts 'Finished!'
