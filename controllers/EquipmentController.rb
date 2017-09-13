class EquipmentController < ApplicationController
  get '/' do
    equipments = Equipment.all
    all_equipments = []
    equipments.each do |equipment|
      rentals = equipment.rentals
      user = equipment.user
      equips_and_rentals = {equipment: equipment, user: user, rentals: rentals}
      all_equipments.push(equips_and_rentals)
    end
    all_equipments.to_json
  end

  get '/userlist' do
    token = params[:token]
    user = User.find_by(token: token)
    equipments = user.equipments
    all_equipments = []
    equipments.each do |equipment|
      rentals = equipment.rentals
      user = equipment.user
      equips_and_rentals = {equipment: equipment, user: user, rentals: rentals}
      all_equipments.push(equips_and_rentals)
    end
    all_equipments.to_json
  end

  get '/jsonlist' do
    equipments = Equipment.all
    equipments.to_json
  end

  get '/:id' do
    id = params[:id]
    equipment = Equipment.find(id)
    equipment.to_json
  end

# SAMPLE DATA
# {"equip_type":"Acoustic Guitar", "model":"Fender", "brand":"FA-100 Dreadnought", "category":"Guitar", "condition":"Excellent", "available":true, "equip_img":"https://cdn.shopify.com/s/files/1/1210/3886/products/fender-fa-100-acoustic-pack-dreadnought_1600x.jpg?v=1468336757", "hourly_rental_price":5.00, "daily_rental_price":50.00, "description":"Lorem ipsum dolor sit amet, consectetuer adipiscing elit.", "user_id":1}
# {"equip_type":"Keyboard", "model":"Grand Piano", "brand":"Yamaha", "category":"Piano", "condition":"Very Good", "available":true, "equip_img":"https://i5.walmartimages.com/asr/2fd04258-e064-43c2-8467-21ba459d8a66_1.3dc7e5bf8fabafa9a1478421a3460435.jpeg", "hourly_rental_price":7.25, "daily_rental_price":65.00, "description":"The Yamaha YPG235 76-Key Portable Grand piano delivers a piano-focused sound set that will propel your music to the next level.", "user_id":2}
# {"equip_type":"Harmonica", "model":"Mini Diatonic", "brand":"Hohner", "category":"Wood wind", "condition":"Great", "available":true, "equip_img":"https://i5.walmartimages.com/asr/1ad7948e-b697-4d31-9a66-e34740275def_1.910ff93289cfbd5c7634e63f289ed6df.jpeg", "hourly_rental_price":10.00, "daily_rental_price":160.00, "description":"These tiny (3.5 cm long) harmonicas are among the smallest commercially manufactured musical instruments in the world. All models have a range of one whole octave and are constructed according to the same exacting standards as the regular models.", "user_id":3}
# {"equip_type":"Fiddle", "model":"", "brand":"Zimtown", "category":"Violin", "condition":"Excellent", "available":true, "equip_img":"https://i5.walmartimages.com/asr/1ad7948e-b697-4d31-9a66-e34740275def_1.910ff93289cfbd5c7634e63f289ed6df.jpeg", "hourly_rental_price":45.00, "daily_rental_price":150.00, "description":"If you're an adult who is a violin learner or enthusiast, it will be a wise decision for you to buy this natural acoustic violin pack, which includes a 4/4 full-size violin, case, bow and rosin.", "user_id":4}
# {"equip_type":"Triangle", "model":"", "brand":"Rhythm Band Musical", "category":"Percussion", "condition":"Ringy!", "available":true, "equip_img":"https://i5.walmartimages.com/asr/81d2c56f-913a-4638-bdad-9acd19b36dba_1.7be7c7e53b440e313d9485d72def2ead.jpeg", "hourly_rental_price":95.00, "daily_rental_price":200.00, "description":"This six-inch Triangle with Striker is great for a variety of uses.", "user_id":5}
# {"equip_type":"Trumpet", "model":"LV100", "brand":"Le'Var", "category":"Wood wind", "condition":"Excellent", "available":true, "equip_img":"https://i5.walmartimages.com/asr/b72be814-d7dc-4773-9be1-003b2b4b3d98_1.8aac21859fb8275d712086fe259a926c.jpeg", "hourly_rental_price":45.00, "daily_rental_price":250.00, "description":"Le'Var LV100 Student Trumpet: Perfect instrument for the trumpet student.", "user_id":6}
# {"equip_type":"Saxophone", "model":"AS-400", "brand":"Jean Paul", "category":"Wood wind", "condition":"New", "available":true, "equip_img":"https://i5.walmartimages.com/asr/63a197ec-489a-4e84-910a-34013800d4e6_1.697cdc1fd4eb3279eb848f270ea94e55.jpeg", "hourly_rental_price":35.00, "daily_rental_price":300.00, "description":"The Jean Paul AS-400 Alto Saxophone is the perfect sax for beginning and intermediate music students. ", "user_id":7}
# {"equip_type":"Clarinet", "model":"USA CL-300", "brand":"Jean Paul", "category":"Wood Wind", "condition":"Excellent", "available":true, "equip_img":"https://i5.walmartimages.com/asr/a9d49b8b-d6f8-42ed-a0d5-47514fbbdbea_1.a1abc6158445c5d72ed5b69c9ace6692.jpeg", "hourly_rental_price":89.00, "daily_rental_price":350.00, "description":"Get a beautiful design with melodic sounds while not having to break the bank with this Jean Paul USA CL 300 Clarinet.", "user_id":8}
# {"equip_type":"Snare Drum", "model":"Black Panther Series", "brand":"Mapex", "category":"Drums", "condition":"Excellent", "available":true, "equip_img":"https://i5.walmartimages.com/asr/8d1b1c3b-3fb7-41f6-852f-2cd738a68b6f_1.c156b358c96409ac302a77bbffc6a5c3.jpeg", "hourly_rental_price":75.00, "daily_rental_price":400.00, "description":"This drum bludgeons its way through the din with extreme volume and a distinct rounded tone.", "user_id":9}
# {"equip_type":"Congas", "model":"Synergy", "brand":"Toca", "category":"Percussion", "condition":"Excellent", "available":true, "equip_img":"https://i5.walmartimages.com/asr/7591e588-8ad2-4c98-9ee1-f440545fc67c_1.3aad8949d01866d70362c49baf37e40f.jpeg", "hourly_rental_price":23.00, "daily_rental_price":150.00, "description":"Conga Set includes a set of Bongos with mounting bracket and stand.", "user_id":10}
  post '/' do
    request_body = JSON.parse(request.body.read)
    equipment = Equipment.new
    equipment.equip_type = request_body["equip_type"]
    equipment.model = request_body["model"]
    equipment.brand = request_body["brand"]
    equipment.category = request_body["category"]
    equipment.condition = request_body["condition"]
    equipment.equip_img = request_body["equip_img"]
    equipment.hourly_rental_price = request_body["hourly_rental_price"]
    equipment.daily_rental_price = request_body["daily_rental_price"]
    equipment.description = request_body["description"]
    equipment.user_id = request_body["user_id"]
    equipment.available = true
    equipment.save
    equipment.to_json
  end

  patch '/:id' do
    id = params[:id]
    equipment = Equipment.find(id)
    request_body = JSON.parse(request.body.read)
    equipment.update_attributes(request_body)
    equipment.save
    equipment.to_json
  end

  patch '/toggle/:id' do
    id = params[:id]
    equipment = Equipment.find(id)
    request_body = JSON.parse(request.body.read)
    equipment.update_attributes(request_body)
    equipment.save
    userId = equipment.user_id
    user = User.find(userId)
    equipments = user.equipments
    all_equipments = []
    equipments.each do |equipment|
      rentals = equipment.rentals
      user = equipment.user
      equips_and_rentals = {equipment: equipment, user: user, rentals: rentals}
      all_equipments.push(equips_and_rentals)
    end
    all_equipments.to_json
  end

  delete '/:id' do
    id = params[:id]
    equipment = Equipment.find(id)
    equipment.destroy
    equipments = Equipment.all
    equipments.to_json
  end

  post '/search' do
    request_body = JSON.parse(request.body.read)
    equipments = Equipment.where("equip_type ilike ?", "%" + request_body["equip_type"] + "%")
    all_equipments = []
    equipments.each do |equipment|
      rentals = equipment.rentals
      user = equipment.user
      equips_and_rentals = {equipment: equipment, user: user, rentals: rentals}
      all_equipments.push(equips_and_rentals)
    end
    all_equipments.to_json
  end

end
