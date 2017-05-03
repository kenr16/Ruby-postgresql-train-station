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
  describe("#id") do
    it("sets city's ID when you save it") do
      city = City.new({:name => "Portland", :id => nil})
      city.save()
      expect(city.id()).to(be_an_instance_of(Fixnum))
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

  describe(".find") do
    it("returns a city by its ID") do
      city1 = City.new({:name => "Portland", :id => nil})
      city1.save()
      city2 = City.new({:name => "Seattle", :id => nil})
      city2.save()
      expect(City.find(city2.id())).to(eq(city2))
    end
  end

end
