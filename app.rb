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
  @message = "Succesfully changes train data."
  @trains = Train.all()
  erb(:trains)
end


get("/cities") do
  @cities = City.all()
  @message = "Welcome to the Cities webpage."
  erb(:cities)
end

post("/cities/new") do
    name = params.fetch("city_name")
    train = City.new({:name => name, :id => nil})
    train.save()
    @message = "Succesfully added new city."
    @cities = City.all()
  erb(:cities)
end

get("/cities/:id") do
  @city = City.find(params.fetch("id").to_i())
  erb(:city)
end
