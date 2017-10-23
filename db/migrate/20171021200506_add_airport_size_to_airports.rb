class AddAirportSizeToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :size, :integer
  end
end
