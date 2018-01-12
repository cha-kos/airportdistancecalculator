class Airport < ActiveRecord::Base
  validates :lat, :lon, :name, :city, :state_full, :state_abv, presence: true

  def self.search_airports(query)
    Airport
      .order("total_routes desc")
      .select("*")
      .where("lower(name) LIKE '#{query + "%"}'
                OR lower(city) LIKE '#{query + "%"}'
                OR lower(state_abv) LIKE '#{query + "%"}'
                OR lower(state_full) LIKE '#{query + "%"}'
                OR lower(code) LIKE '#{query + "%"}'
                ")
      .limit(15)
  end

end
