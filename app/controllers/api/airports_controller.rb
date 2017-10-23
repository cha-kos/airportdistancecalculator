class Api::AirportsController < ApplicationController

  def index
    @airports =
      Airport
        .order("total_routes desc")
        .select("*")
        .where("lower(name) LIKE '#{params["query"]+"%"}'
                  OR lower(city) LIKE '#{params["query"]+"%"}'
                  OR lower(state_abv) LIKE '#{params["query"]+"%"}'
                  OR lower(state_full) LIKE '#{params["query"]+"%"}'
                  OR lower(code) LIKE '#{params["query"]+"%"}'
                  ")
        .limit(15)
  end


end
