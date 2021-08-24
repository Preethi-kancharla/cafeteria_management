class AddRatingsToMenuItems < ActiveRecord::Migration[6.1]
  def change
    add_column :menu_items, :ratings, :decimal, precision: 2, scale: 1, default: 0.0
    add_column :menu_items, :no_of_ratings, :integer, default: 0
  end
end
