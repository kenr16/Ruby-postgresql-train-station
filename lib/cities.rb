class City
  attr_accessor(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_cities = DB.exec("SELECT * FROM cities;")
    cities = []
    returned_cities.each() do |city|
      name = city.fetch("name")
      id = city.fetch("id").to_i()
      cities.push(City.new({:name => name, :id => id}))
    end
    cities
  end

  define_method(:==) do |another_city|
    self.name().==(another_city.name()).&(self.id().==(another_city.id()))
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO cities (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first.fetch("id").to_i()
  end

  define_singleton_method(:find) do |id|
    found_city = nil
    City.all().each() do |city|
      if city.id().==(id)
        found_city = city
      end
    end
    found_city
  end

end
