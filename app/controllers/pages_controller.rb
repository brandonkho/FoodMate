class PagesController < ApplicationController
  def index

  end


  def main
  	@users = User.all
  end 

  def page
  end
  def show 
      @prefs = Preference.all
      @users = User.all
      @foods = Food.all
  end
end
