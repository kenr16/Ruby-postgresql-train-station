class Stop
  attr_accessor(:id, :name, :city_id, :train_id)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @city_id = attributes.fetch(:city_id)
    @train_id = attributes.fetch(:train_id)
  end

  define_singleton_method(:all) do
    returned_stops = DB.exec("SELECT * FROM stops;")
    stops = []
    returned_stops.each() do |stop|
      name = stop.fetch("name")
      birthday = stop.fetch("birthday")
      doctor_id = stop.fetch("doctor_id").to_i()
      stops.push(Patient.new({:name => name, :birthday => birthday, :doctor_id => doctor_id}))
    end
    stops
  end

end
