require 'securerandom'

class UserController < ApplicationController
  
  get '/' do
    users = User.all
    users.to_json
  end

  get '/register/:id' do
    id = params[:id]
    user = User.find(id)
    user.to_json
  end

  get '/:id' do
    id = params[:id]
    user = User.find(id)
    equipments = user.equipments
    {user: user, equipments: equipments}.to_json
  end

# SAMPLE DATA

# {"firstname":"Joe", "lastname":"Smith", "email":"joe@gs.com", "username":"joe", "password":"soccer123", "address":"150 N. Michigan Avenue", "city":"Chicago", "state":"IL", "zip":60609}
# {"firstname":"David", "lastname":"Cady", "email":"david@gs.com", "username":"david", "password":"soccer123", "address":"150 N. Michigan Avenue", "city":"Chicago", "state":"IL", "zip":60609}
# {"firstname":"Ayo", "lastname":"Obajuluwa", "email":"ayo@gs.com", "username":"ayo", "password":"soccer123", "address":"150 N. Michigan Avenue", "city":"Chicago", "state":"IL", "zip":60609}
# {"firstname":"Greg", "lastname":"Wilwerding", "email":"greg@gs.com", "username":"greg", "password":"soccer123", "address":"150 N. Michigan Avenue", "city":"Chicago", "state":"IL", "zip":60609}
# {"firstname":"Sam", "lastname":"Rolfe", "email":"sam@gs.com", "username":"sam", "password":"soccer123", "address":"150 N. Michigan Avenue", "city":"Chicago", "state":"IL", "zip":60609}
# {"firstname":"Julian", "lastname":"Craigwell-Graham", "email":"julian@gs.com", "username":"julian", "password":"soccer123", "address":"150 N. Michigan Avenue", "city":"Chicago", "state":"IL", "zip":60609}
# {"firstname":"Payne", "lastname":"Richards", "email":"payne@gs.com", "username":"payne", "password":"soccer123", "address":"150 N. Michigan Avenue", "city":"Chicago", "state":"IL", "zip":60609}
# {"firstname":"Lindsey", "lastname":"Gilmore", "email":"lindsey@gs.com", "username":"lindsey", "password":"soccer123", "address":"150 N. Michigan Avenue", "city":"Chicago", "state":"IL", "zip":60609}
# {"firstname":"Jackson", "lastname":"Tenclay", "email":"jackson@gs.com", "username":"jackson", "password":"soccer123", "address":"150 N. Michigan Avenue", "city":"Chicago", "state":"IL", "zip":60609}
# {"firstname":"Benn", "lastname":"Myers", "email":"benn@gs.com", "username":"benn", "password":"soccer123", "address":"150 N. Michigan Avenue", "city":"Chicago", "state":"IL", "zip":60609}
# {"firstname":"Annie", "lastname":"James", "email":"annie@gs.com", "username":"annie", "password":"soccer123", "address":"150 N. Michigan Avenue", "city":"Chicago", "state":"IL", "zip":60609}
  post '/register' do
    request_body = JSON.parse(request.body.read)
    user = User.new
    user.first_name = request_body["firstname"]
    user.last_name = request_body["lastname"]
    user.email = request_body["email"]
    user.username = request_body["username"]
    user.password = request_body["password"]
    user.address = request_body["address"]
    user.city = request_body["city"]
    user.state = request_body["state"]
    user.zip = request_body["zip"]
    user.token = securerandom.hex
    user.save
    user.to_json
  end

  patch '/login/:id' do
    id = params[:id]
    user_details = JSON.parse(request.body.read)
    user = User.find(id)
    user.update_attributes(user_details)
    user.save
    user.to_json
  end

  patch '/:id' do
    id = params[:id]
    user = User.find(id)
    request_body = JSON.parse(request.body.read)
    user.update_attributes(request_body)
    user.save
    user.to_json
  end

  delete '/:id' do
    id = params[:id]
    user = User.find(id)
    user.destroy
    users = User.all
    users.to_json
  end

  post '/login' do
    user_details = JSON.parse(request.body.read)
    user = User.find_by({username: user_details["username"]})
    if user && user.authenticate(user_details["password"])
      user.to_json
    else
      "ACCESS DENIED"
    end
  end

end
