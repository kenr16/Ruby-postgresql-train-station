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
end
