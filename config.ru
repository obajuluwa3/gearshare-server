require 'bundler'
Bundler.require

require './models/EquipmentModel'
require './models/UserModel'
require './models/RentalModel'

require './controllers/ApplicationController'
require './controllers/EquipmentController'
require './controllers/RentalController'
require './controllers/UserController'

run Sinatra::Application

if ENV['DATABASE_URL']
	db = URI.parse(ENV['DATABASE_URL'])
	ActiveRecord::Base.establish_connection(
	  	adapter: 'postgresql',
	  	host: db.host,
	  	port: db.port,
	  	username: db.user,
	  	password: db.password,
	  	database: db.path[1..-1],
	  	encoding: 'utf8'
  	)
else
	ActiveRecord::Base.establish_connection(
	  	adapter: 'postgresql',
	  	database: 'equipment_rental'
  	)
end

map('/equipments'){run EquipmentController}
map('/users'){run UserController}
map('/rentals'){run RentalController}