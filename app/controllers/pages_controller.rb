class PagesController < ApplicationController
  def index
     
  end


  def main
  	@users = User.all
  end 

  def page
 	  
  end

  def restaurant_query
    category = params[:category]
    @query = Yelp.client.search('Berkeley', { term: category })
  end
end
