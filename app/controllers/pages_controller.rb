class PagesController < ApplicationController
  def index
  end
  def show 
      @prefs = Preference.all
      @users = User.all
      @foods = Food.all
  end
end
