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
  end
end
