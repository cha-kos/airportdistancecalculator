class AddTotalRoutesToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :total_routes, :integer
  end
end
