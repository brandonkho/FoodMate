class Restaurant < ActiveRecord::Base
	belongs_to :preference, :class_name => "Preference", :foreign_key => "preference_id"
end
