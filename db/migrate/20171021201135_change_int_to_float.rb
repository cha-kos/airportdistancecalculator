class ChangeIntToFloat < ActiveRecord::Migration
  def up
    change_column :airports, :lat, :integer
    change_column :airports, :lon, :integer
  end

  def down
    change_column :airports, :lat, :float
    change_column :airports, :lon, :float
  end
end
