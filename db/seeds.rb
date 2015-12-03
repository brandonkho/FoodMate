# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Foods (may delete later)
%w(Pizza Burger).each do |name|
  Food.create name: name
end

# Restaurants
%w(McDonalds Bleecker_Bistro Sliver Artichoke Cheese_Board Baron_Bakery Cafe_3 Crossroads Foothill Clark_Kerr Nijiya Los_Charros Posh_Bagel Tea_Era Berkeley_Bowl Athineon Flacos_Tacos Great_China Chengdu_Style Burger_King Taco_Bell In_n_Out La_Burrita Dot_Island Top_Dog Dumpling_Express Urban_Turbann Toss_Noodle Koja_Kitchen).each do |name|
  rest = Restaurant.create! name: name
end

# Preferences
count = Restaurant.count
%w(American Hungarian Iberian Indian Indonesian Irish Italian Japanese Korean Kosher Laotian).each do |name|
  pref = Preference.create! name: name
  pref.restaurants << Restaurant.find(count)
  count -= 1
end

# Users
count = 1
%w(Kamran Leanne Kishan Brandon).each do |name|
  user = User.create! name: name, email: name+"@pokeportal.com", password: 'password', zipcode: 94720
  user.preferences << Preference.find(count)
  user.preferences << Preference.find(count + 1)
  count += 2
end
