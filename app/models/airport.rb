class Airport < ActiveRecord::Base
  validates :lat, :lon, :name, :city, :state_full, :state_abv, presence: true

end
