class PagesController < ApplicationController
  def index
     
  end


  def main
  	@users = User.all
  end 

  def page
 	@query = Yelp.client.search('San Francisco', { term: 'food' })
  end

end
