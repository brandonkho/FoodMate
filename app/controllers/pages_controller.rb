class PagesController < ApplicationController
  def index

  end


  def main
  	@users = User.all
  end 

  def page
  end
end
