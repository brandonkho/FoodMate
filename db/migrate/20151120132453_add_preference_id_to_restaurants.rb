class AddPreferenceIdToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :preference_id, :integer
  end
end
