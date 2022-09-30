# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Rails.env.development?
    AdminUser.create!(email: 'admin55@example.com', password: 'password', password_confirmation: 'password')
    Product.create!(name: Faker::Beer.name, price: Faker::Commerce.price(range: 0..39.0), description: "#{Faker::Beer.style} #{Faker::Beer.alcohol}}")
    Product.create!(name: Faker::Beer.name, price: Faker::Commerce.price(range: 0..39.0), description: "#{Faker::Beer.style} #{Faker::Beer.alcohol}")
    Product.create!(name: Faker::Dessert.variety, price: Faker::Commerce.price(range: 0..39.0))
    Product.create!(name: Faker::Dessert.variety, price: Faker::Commerce.price(range: 0..39.0))
    Product.create!(name: Faker::Tea.variety, price: Faker::Commerce.price(range: 0..39.0), description: Faker::Tea.type)
    Product.create!(name: Faker::Coffee.blend_name, price: Faker::Commerce.price(range: 0..39.0), description: Faker::Coffee.notes)
    Client.create!(password: 'password', password_confirmation: 'password', email: Faker::Internet.email)
    Client.create!(password: 'password', password_confirmation: 'password', email: Faker::Internet.email)
    Client.create!(password: 'password', password_confirmation: 'password', email: Faker::Internet.email)
end