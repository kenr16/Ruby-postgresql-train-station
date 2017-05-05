class Stop
  attr_accessor(:id, :name, :city_id, :train_id, :time)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @city_id = attributes.fetch(:city_id)
    @train_id = attributes.fetch(:train_id)
    @time = attributes.fetch(:time)
  end

  define_singleton_method(:all) do
    returned_stops = DB.exec("SELECT * FROM stops;")
    stops = []
    returned_stops.each() do |stop|
      name = stop.fetch("name")
      city_id = stop.fetch("city_id").to_i
      train_id = stop.fetch("train_id").to_i
      time = stop.fetch("time")
      id = stop.fetch("id").to_i
      stops.push(Stop.new({:id => id, :name => name, :city_id => city_id, :train_id => train_id, :time => time}))
    end
    stops
  end

  define_method(:==) do |another_stop|
    self.name().==(another_stop.name())
    .&(self.id().==(another_stop.id()))
    .&(self.time().==(another_stop.time()))
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stops (name, city_id, train_id, time) VALUES ('#{@name}', #{@city_id}, '#{@train_id}', '#{@time}') RETURNING id;")
    @id = result.first.fetch("id").to_i()
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name)
    @city_id = attributes.fetch(:city_id)
    @train_id = attributes.fetch(:train_id)
    @time = attributes.fetch(:time)
    @id = self.id()
    DB.exec("UPDATE stops SET name = '#{@name}' WHERE id = #{@id};")
    DB.exec("UPDATE stops SET name = '#{@city_id}' WHERE id = #{@id};")
    DB.exec("UPDATE stops SET name = '#{@train_id}' WHERE id = #{@id};")
    DB.exec("UPDATE stops SET name = '#{@time}' WHERE id = #{@id};")
  end

  define_singleton_method(:find_stops_for_city) do |city_id|
    @id = city_id
    returned_stops = DB.exec("SELECT * FROM stops WHERE city_id = #{@id};")
    stops = []
    returned_stops.each() do |stop|
      id = stop.fetch("id").to_i()
      city_id = stop.fetch("city_id").to_i()
      train_id = stop.fetch("train_id").to_i()
      name = stop.fetch("name")
      time = stop.fetch("time")
      stops.push(Stop.new({:id => id, :city_id => city_id, :train_id => train_id, :name => name, :time => time}))
    end
    stops.sort! { |a,b| a.time <=> b.time }
  end

  define_singleton_method(:find_stops_for_train) do |train_id|
    @id = train_id
    returned_stops = DB.exec("SELECT * FROM stops WHERE train_id = #{@id};")
    stops = []
    returned_stops.each() do |stop|
      id = stop.fetch("id").to_i()
      city_id = stop.fetch("city_id").to_i()
      train_id = stop.fetch("train_id").to_i()
      name = stop.fetch("name")
      time = stop.fetch("time")
      stops.push(Stop.new({:id => id, :city_id => city_id, :train_id => train_id, :name => name, :time => time}))
    end
    stops.sort! { |a,b| a.time <=> b.time }
  end

end
