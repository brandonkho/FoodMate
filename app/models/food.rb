class Food < ActiveRecord::Base
	has_many :restaurants
	belongs_to :preference
end
