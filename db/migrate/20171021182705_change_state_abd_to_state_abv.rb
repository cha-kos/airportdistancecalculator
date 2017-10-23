class ChangeStateAbdToStateAbv < ActiveRecord::Migration
  def self.up
    rename_column :airports, :state_abd, :state_abv
  end
end
