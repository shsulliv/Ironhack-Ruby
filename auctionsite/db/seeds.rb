# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.destroy_all
User.destroy_all

puts "I have just destroyed all the users and products!"

shannon = User.create!(name: "Shannon", email: "some@mail.com")

shannon.products.create!(title: "coffee pot", description: "some old coffee pot", deadline: DateTime.now.next_month)

llorenç = User.create!(name: "Llorenç", email: "llorenç@mail.com")

llorenç.products.create!(title: "Mix tape", description: "Pure FIRE.", deadline: DateTime.now.next_month)

eliza = User.create!(name: "Eliza", email: "eliza@mail.com")

eliza.products.create!(title: "Mix Table", description: "Vintage", deadline: DateTime.now.next_month)

maegan = User.create!(name: "Maegan", email: "maegan@mail.com")

maegan.products.create!(title: "Lighter", description: "Has a pretty 'Maple Leaf' on it.", deadline: DateTime.now.next_month)

baptiste = User.create!(name: "Baptiste", email: "baptiste@mail.com")

baptiste.products.create!(title: "Air Conditioner", description: "Perfect for suffocating, crypt-like classroom spaces.", deadline: DateTime.now.next_month)

