class Preference < ActiveRecord::Base
	has_many :users
	has_many :restaurants
	has_many :foods
end
