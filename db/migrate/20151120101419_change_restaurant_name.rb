class ChangeRestaurantName < ActiveRecord::Migration
  def change
  	rename_column :restaurants, :restaurant, :name
  end
end
