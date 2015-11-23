class ChangePreferenceName < ActiveRecord::Migration
  def change
  	rename_column :preferences, :category, :name
  end
end
