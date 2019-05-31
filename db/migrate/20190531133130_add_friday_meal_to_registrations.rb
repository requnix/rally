class AddFridayMealToRegistrations < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :friday_meal, :boolean
  end
end
