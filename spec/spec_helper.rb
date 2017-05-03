require("rspec")
require("pg")
require("cities.rb")
require("trains.rb")
require("stops.rb")
require("pry")

DB = PG.connect({:dbname => "train_database_test"})


RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM cities *;")
    DB.exec("DELETE FROM stops *;")
    DB.exec("DELETE FROM trains *;")
  end
end
