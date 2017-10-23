require 'net/http'
require 'json'
require 'csv'


Airport.destroy_all

STATE_ABBR_TO_NAME = {
    'AL' => 'Alabama',
    'AK' => 'Alaska',
    'AS' => 'America Samoa',
    'AZ' => 'Arizona',
    'AR' => 'Arkansas',
    'CA' => 'California',
    'CO' => 'Colorado',
    'CT' => 'Connecticut',
    'DE' => 'Delaware',
    'DC' => 'District of Columbia',
    'FM' => 'Federated States Of Micronesia',
    'FL' => 'Florida',
    'GA' => 'Georgia',
    'GU' => 'Guam',
    'HI' => 'Hawaii',
    'ID' => 'Idaho',
    'IL' => 'Illinois',
    'IN' => 'Indiana',
    'IA' => 'Iowa',
    'KS' => 'Kansas',
    'KY' => 'Kentucky',
    'LA' => 'Louisiana',
    'ME' => 'Maine',
    'MH' => 'Marshall Islands',
    'MD' => 'Maryland',
    'MA' => 'Massachusetts',
    'MI' => 'Michigan',
    'MN' => 'Minnesota',
    'MS' => 'Mississippi',
    'MO' => 'Missouri',
    'MT' => 'Montana',
    'NE' => 'Nebraska',
    'NV' => 'Nevada',
    'NH' => 'New Hampshire',
    'NJ' => 'New Jersey',
    'NM' => 'New Mexico',
    'NY' => 'New York',
    'NC' => 'North Carolina',
    'ND' => 'North Dakota',
    'OH' => 'Ohio',
    'OK' => 'Oklahoma',
    'OR' => 'Oregon',
    'PW' => 'Palau',
    'PA' => 'Pennsylvania',
    'PR' => 'Puerto Rico',
    'RI' => 'Rhode Island',
    'SC' => 'South Carolina',
    'SD' => 'South Dakota',
    'TN' => 'Tennessee',
    'TX' => 'Texas',
    'UT' => 'Utah',
    'VT' => 'Vermont',
    'VI' => 'Virgin Island',
    'VA' => 'Virginia',
    'WA' => 'Washington',
    'WV' => 'West Virginia',
    'WI' => 'Wisconsin',
    'WY' => 'Wyoming'
  }

csv_text = File.read(Rails.root.join('lib', 'seeds', 'airports.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
  a = Airport.new
  a.lat = row["latitude"]
  a.lon = row["longitude"]
  a.name = row["name"]
  a.city = row["city"]
  a.state_abv = row["state"]
  a.state_full = STATE_ABBR_TO_NAME[row["state"]]
  a.code = row["iata"]
  a.save
end

#Route Seed
Route.destroy_all

routes_text = File.read(Rails.root.join('lib', 'seeds', 'routes.csv'))
routes = CSV.parse(routes_text, :headers => true, :encoding => 'ISO-8859-1')

routes.each do |row|
  a = Route.new
  a.source = row["source"]
  a.destination = row["destination"]
  a.save
end

# Add Total Routes to Airports
Airport.all.each do |airport|
  dest_count = Route.group(:destination).count
  source_count = Route.group(:destination).count

  if (dest_count[airport.code] && source_count[airport.code])
    total_routes = dest_count[airport.code] + source_count[airport.code]
    airport.total_routes = total_routes
    airport.save
  else
    airport.total_routes = 0
    airport.save
  end
end




## External API Seed
# url = 'https://api.aerisapi.com/places/airports/search?limit=3000&query=country:us&client_id=jwQERXuHQ0MNMrYVgYCHi&client_secret=3g6kfQh3hHfwr99dxyttp7Ap60tG1tCKrZF1P4Ms'
# uri = URI(url)
#
# response = Net::HTTP.get(uri)
# data = JSON.parse(response)
#
# data["response"].each do |airport|
#
#   if  (airport["profile"]["typeENG"] == "small airport")
#     size = 3
#   elsif (airport["profile"]["typeENG"] == "medium airport")
#     size = 2
#   elsif (airport["profile"]["typeENG"] == "large airport")
#     size = 1
#   end
#   Airport.create(
#     lat: airport["loc"]["lat"],
#     lon: airport["loc"]["long"],
#     name: airport["place"]["name"],
#     city: airport["place"]["city"],
#     state_full: airport["place"]["stateFull"],
#     state_abv: airport["place"]["state"],
#     code: airport["profile"]["iata"],
#     size: size
#     )
#
# end
