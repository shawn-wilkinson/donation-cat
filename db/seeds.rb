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


test_charity = Charity.create(name:"Lucky Dog Animal Rescue", description: "Lucky Dog Animal Rescue is a non-profit organization dedicated to rescuing homeless and abandoned animals, primarily dogs from high-kill shelters and owners who can no longer care for them. By working with committed volunteers, foster homes, local veterinarians, trainers, and boarding facilities, we are able to rescue hundreds of animals every year, provide them with loving temporary care, and find them well-matched, carefully screened forever homes. We also serve as a resource to our community and all pet owners by providing education and information on responsible pet ownership, including the importance of spay/neuter, positive behavior training, and good nutrition.", contact_name: Faker::Name.name, contact_email: Faker::Internet.email , password_hash:"password")

test_category = Category.find_by(name: "Animal Advocacy")
test_category.charities << test_charity

test_charity.wishlists.create!(name: "Our Wishlist", link: "http://www.amazon.com/gp/registry/wishlist/ref=cm_wl_act_print_v?ie=UTF8&disableNav=1&filter=all&id=3AW1BUYSY69G5&items-per-page=200&layout=standard-print&sort=date-added&visitor-view=1" )


users_array = []
10.times do
<<<<<<< HEAD
  us = User.create(username:Faker::Name.name,email:Faker::Internet.email, password:"password")
=======
  us = User.create(username:Faker::Name.name,email:Faker::Internet.email,password:"password")
>>>>>>> 8e8da473547e5b91b900c8ce6b73bf2c3c94317e
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


