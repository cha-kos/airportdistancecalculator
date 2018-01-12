# US Airport Distance Calculator

US Airport distance calculator is a web-app which calculates the distance in Nautical Miles between any two US airports.
Choose an origin airport and destination airport, an icon will be placed on the map representing each airport location.
The click the `Calculate Distance` button and the total distance in Nautical Miles between airports will be displayed
along with the flight path between airports. Search results are sorted based on relevance and number of incoming and outgoing
routes at each airport.

## Getting Started

To run this application locally on your machine, first navigate to the `Hakos_Chris - Moat_Q2A` folder via your command line.

#### Ruby
Please make sure you have Ruby installed on your computer by running
`ruby -v` in your command line. The current running version should be returned.

If you do not have ruby installed, please install. For OSX users you can run the command
`brew install ruby`
For any other operating systems please refer to the documentation. https://www.ruby-lang.org/en/documentation/installation/

#### Rails
Please make sure you have Rails installed on your computer by running
`rails -v` in your command line. The current running version should be returned.

If you do not have rails installed, please install. Refer to this tutorial for instructions.
https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm

#### Node & NPM
Please make sure you have Node and NPM installed on your computer by running
`node-v `
  &
`npm -v`
Both of these commands should return the current running versions.

If you do not have node & npm installed, please install. For OSX users you can
install them both by running `brew install node` in your command line.
For any other operating systems please refer to the Node documentation.
https://nodejs.org/en/download/package-manager/

## Launching the app
Once you have all of the proper software installed, please run the following commands
from you command line, inside of the `Hakos_Chris - Moat_Q2A` folder.

Install Rails dependencies
`bundle install`

Install NPM dependencies
`npm install`

Setup Database. This will take a few minutes for data is being compiled to achieve more
accurate search results.
`bundle exec rake db:setup`

Start Rails Server
`rails s`

Open a new Terminal tab and run webpack
`npm run webpack`

Navigate your web browser to http://localhost:3000/ and enjoy!

Note: You must be simultaneously running the rails server and webpack for the
app to work.
