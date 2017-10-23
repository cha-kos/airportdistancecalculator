class Api::AirportsController < ApplicationController

  def index

    # Query database for airports with search query matching:
    #   -Aiport Name
    #   -City
    #   -State Abbreviation
    #   -State Full Name
    #   -Airport IATA Code

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
