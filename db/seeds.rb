require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


cat = []
cat << Category.create(name:"Environment")
cat << Category.create(name:"Education")
cat << Category.create(name:"Animal Advocacy")
cat << Category.create(name:"Social Services")
cat << Category.create(name:"Children")
cat << Category.create(name:"Health")
cat << Category.create(name:"Economic Empowerment")
cat << Category.create(name:"Religious")
cat << Category.create(name:"International")

char = []
char << Charity.create(name:"Penguin International", description: Faker::Lorem.paragraph, contact_name: Faker::Name.name, contact_email: Faker::Internet.email , password_hash:"password")
char << Charity.create(name:"Fund For Space Cats", description: Faker::Lorem.paragraph, contact_name: Faker::Name.name, contact_email: Faker::Internet.email , password_hash:"password")
char << Charity.create(name:"Trees and Love", description: Faker::Lorem.paragraph, contact_name: Faker::Name.name, contact_email: Faker::Internet.email , password_hash:"password")
char << Charity.create(name:"Open Door Mission", description: Faker::Lorem.paragraph, contact_name: Faker::Name.name, contact_email: Faker::Internet.email , password_hash:"password")
char << Charity.create(name:"Island House", description: Faker::Lorem.paragraph, contact_name: Faker::Name.name, contact_email: Faker::Internet.email , password_hash:"password")

users_array = []
10.times do
  us = User.create(username:Faker::Name.name,email:Faker::Internet.email, password:"password")
  us.categories << cat.sample(2)
  us.charities << char.sample(2)
  users_array << us
end

char.each do |ch|
  new_wishlist = Wishlist.create(name:"Our Wishlist")
  ch.wishlists << new_wishlist
  ch.categories << cat.sample(2)
  10.times do
    it = Item.create(name:Faker::Commerce.product_name, current_price:(rand(50) + 1))
    it.users << users_array.sample
    new_wishlist.items << it
  end
end


