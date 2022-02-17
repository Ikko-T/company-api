# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.delete_all

5.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  company = Faker::Company.name
  email = Faker::Internet.email
  gender = rand(0..2)
  age = rand(0..120)
  phone_number = Faker::PhoneNumber.cell_phone
  twitter = "@#{first_name}".downcase
  message = Faker::Lorem.paragraph

  User.create!(
    first_name: first_name,
    last_name: last_name,
    company: company,
    email: email,
    gender: gender,
    age: age,
    phone_number: phone_number,
    twitter: twitter,
    message: message
  )
end

puts "Data successfully inserted!"
