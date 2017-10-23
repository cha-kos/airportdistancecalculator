class ChangeLatAndLonType < ActiveRecord::Migration
  def change
    change_column :airports, :lat, :float
    change_column :airports, :lon, :float
  end
end
