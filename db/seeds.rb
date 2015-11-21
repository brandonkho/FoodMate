# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w(Pizza Burger).each do |name|
  Food.create name: name
end

# Make other trainers
%w(Kamran Leanne Kishan Brandon).each do |name|
  user = User.create! name: name, email: name+"@pokeportal.com", password: 'password'
  pref = user.preferences.create! name: "American"
  pref.restaurants.create!(name: "McDonalds")
end

%w(Hungarian Iberian Indian Indonesian Irish Italian Japanese Korean Kosher Laotian).each do |name|
  Preference.create name: name
end


