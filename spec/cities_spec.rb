require("spec_helper")

describe("City") do
  describe(".all") do
    it("starts off with no cities") do
      expect(City.all()).to(eq([]))
    end
  end
  describe("#name") do
    it("tells you the city's name") do
      city = City.new({:name => "Portland", :id => nil})
      expect(city.name()).to(eq("Portland"))
    end
  end

  describe("#==") do
    it("is the same city if it has the same name and id") do
      city1 = City.new({:name => "Portland", :id => nil})
      city2 = City.new({:name => "Portland", :id => nil})
      expect(city1).to(eq(city2))
    end
  end

  describe("#save") do
    it("lets you save the city to the database") do
      city = City.new({:name => "Portland", :id => nil})
      city.save()
      expect(City.all()).to(eq([city]))
    end
  end

  describe("#id") do
    it("sets city's ID when you save it") do
      city = City.new({:name => "Portland", :id => nil})
      city.save()
      expect(city.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".find") do
    it("returns a city by its ID") do
      city1 = City.new({:name => "Portland", :id => nil})
      city1.save()
      city2 = City.new({:name => "Seattle", :id => nil})
      city2.save()
      expect(City.find(city2.id())).to(eq(city2))
    end
  end

  describe("#stops") do
    it("returns an array of stops for this city") do
      city1 = City.new({:name => "Portland", :id => nil})
      city1.save()
      stop1 = Stop.new({:id => 3, :name => "Green", :city_id => 15, :train_id => 1, :time => '2017-01-01 00:05:30'})
      stop1.save()
      stop2 = Stop.new({:id => 2, :name => "Red", :city_id => city1.id(), :train_id => 1, :time => '2017-01-01 00:05:30'})
      stop2.save()
      stop3 = Stop.new({:id => 1, :name => "Blue", :city_id => city1.id(), :train_id => 2, :time => '2017-01-01 00:05:00'})
      stop3.save()
      expect(city1.stops(city1.id())).to(eq([stop2, stop3]))
    end
  end

  describe("#update") do
    it("lets you update cities in the database") do
      city = City.new({:name => "Portland", :id => nil})
      city.save()
      city.update({:name => "Vancouver"})
      expect(city.name()).to(eq("Vancouver"))
    end
  end

  describe("#delete") do
    it("lets you delete a city from the database") do
      city = City.new({:name => "Portland", :id => nil})
      city.save()
      city2 = City.new({:name => "Seattle", :id => nil})
      city2.save()
      stop1 = Stop.new({:id => 3, :name => "Green", :city_id => city2.id, :train_id => 1, :time => '2017-01-01 00:05:30'})
      stop1.save()
      city2.delete()
      expect(City.all()).to(eq([city]))
      expect(Stop.all()).to(eq([]))
    end
  end
end
