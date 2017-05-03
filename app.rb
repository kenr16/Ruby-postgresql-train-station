require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/cities")
require("./lib/stops")
require("./lib/trains")
require("pg")
require("pry")

DB = PG.connect({:dbname => "train_database"})

get("/") do
  erb(:index)
end

get("/trains") do
  @trains = Train.all()
  @message = "Welcome to the Trains webpage."
  erb(:trains)
end

post("/trains/new") do
    name = params.fetch("train_name")
    type = params.fetch("train_type")
    train = Train.new({:name => name, :id => nil, :type => type})
    train.save()
    @message = "Succesfully added new train."
    @trains = Train.all()
  erb(:trains)
end

get("/trains/:id") do
  @train = Train.find(params.fetch("id").to_i())
  erb(:train)
end

get("/trains/:id/edit") do
  @train = Train.find(params.fetch("id").to_i())
  erb(:train_edit)
end

patch("/trains/:id") do
  name = params.fetch("train_name")
  type = params.fetch("train_type")
  @train = Train.find(params.fetch("id").to_i())
  @train.update({:name => name, :type => type})
  @message = "Succesfully changed train data."
  @trains = Train.all()
  erb(:trains)
end


get("/cities") do
  @cities = City.all()
  @message = "Welcome to the Cities webpage."
  erb(:cities)
end

post("/cities/new") do
    city_name = params.fetch("city_name")
    city = City.new({:name => city_name, :id => nil})
    city.save()
    @message = "Succesfully added new city."
    @cities = City.all()
  erb(:cities)
end

get("/cities/:id") do
  @city = City.find(params.fetch("id").to_i())
  erb(:city)
end

get("/cities/:id/edit") do
  @city = City.find(params.fetch("id").to_i())
  erb(:city_edit)
end

patch("/cities/:id") do
  city_name = params.fetch("city_name")
  @city = City.find(params.fetch("id").to_i())
  @city.update({:name => city_name})
  @message = "Succesfully changed city data."
  @cities = City.all()
  erb(:cities)
end

get("/stops") do
  @cities = City.all()
  @trains = Train.all()
  @message = "Add a new stop:"
  erb(:stops)
end

post("/stops") do
  stop_name = params.fetch("stop_name")
  train_id = params.fetch("train_id")
  city_id = params.fetch("city_id")
  date = params.fetch("date")
  time = params.fetch("time")
  date_time = date.concat(" ") + time
  new_stop = Stop.new({:id => nil, :name => stop_name, :train_id => train_id, :city_id => city_id, :time => date_time})
  new_stop.save()
  @cities = City.all()
  @trains = Train.all()
  @message = "Successfully added a new stop."
  erb(:stops)
end
