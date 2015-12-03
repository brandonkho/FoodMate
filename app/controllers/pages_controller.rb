class PagesController < ApplicationController
  def index
     
  end


  def main
  	@users = User.all
  end 

  def page
 	  
  end

  def restaurant_query
    # Determine the city
    if user_signed_in?
      city = ZipCodes.identify(current_user.zipcode.to_s)[:city]
    else
      city = 'Berkeley'
    end
    
    category = params[:category]
    @query = Yelp.client.search(city, { term: category })
    pref = Preference.create name: category
    if user_signed_in?
      current_user.preferences << pref
      
      # Find the user a mate!
      users = User.all
      if users.length > 1
        @mate = User.find(rand(1..users.length))
        until @mate.id != current_user.id do
          @mate = User.find(rand(1..users.length))
        end
    
        # This is really inefficient but who cares right now
        potential_mates = Array.new
        users.each do |user|
          if user.zipcode == current_user.zipcode && user.id != current_user.id
            potential_mates.push(user)
          end
        end
        
        if potential_mates.any?
          @mate = potential_mates[rand(0..(potential_mates.length - 1))]
        end
      end
    end
  end
end
