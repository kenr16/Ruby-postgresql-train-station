require("spec_helper")

describe(Stop) do

  describe(".all") do
    it("is empty at first") do
      expect(Stop.all()).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same stop if it has the same name") do
      stop1 = Stop.new({:id => 1, :name => "Blue", :city_id => 1, :train_id => 1, :time => '2017-01-01 00:05'})
      stop2 = Stop.new({:id => 2, :name => "Red", :city_id => 2, :train_id => 3, :time => '2017-01-01 00:05'})
      stop3 = Stop.new({:id => 1, :name => "Blue", :city_id => 1, :train_id => 1, :time => '2017-01-01 00:05'})
      expect(stop1==stop3).to(eq(true))
    end
  end

  describe('#save') do
    it("adds a stop to the array of saved stops") do
      test_stop = Stop.new({:id => nil, :name => "Blue", :city_id => 1, :train_id => 1, :time => '2017-01-01 00:05:00'})
      test_stop.save()
      expect(Stop.all()).to(eq([test_stop]))
    end
  end

  describe("#id") do
    it("sets stops's ID when you save it") do
      stop = Stop.new({:id => nil, :name => "Blue", :city_id => 1, :train_id => 1, :time => '2017-01-01 00:05:00'})
      stop.save()
      expect(stop.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#name') do
    it("lets you view the stop's name") do
      stop = Stop.new({:id => nil, :name => "Blue", :city_id => 1, :train_id => 1, :time => '2017-01-01 00:05:00'})
      expect(stop.name()).to(eq("Blue"))
    end
  end

  describe('#time') do
    it("lets you view the stop's time") do
      stop = Stop.new({:id => nil, :name => "Blue", :city_id => 1, :train_id => 1, :time => '2017-01-01 00:05'})
      stop.save()
      expect(stop.time()).to(eq("2017-01-01 00:05"))
    end
  end

  describe('#city_id') do
    it("lets you view the stop's city_id") do
      stop = Stop.new({:id => nil, :name => "Blue", :city_id => 101, :train_id => 1, :time => '2017-01-01 00:05:00'})
      expect(stop.city_id()).to(eq(101))
    end
  end

  describe('#train_id') do
    it("lets you view the stop's train_id") do
      stop = Stop.new({:id => nil, :name => "Blue", :city_id => 101, :train_id => 16, :time => '2017-01-01 00:05:00'})
      expect(stop.train_id()).to(eq(16))
    end
  end

  describe("#update") do
    it("lets you update trains in the database") do
      stop = Stop.new({:id => nil, :name => "Blue", :city_id => 101, :train_id => 16, :time => '2017-01-01 00:05:00'})
      stop.save()
      stop.update({:id => nil, :name => "Burnside", :city_id => 101, :train_id => 16, :time => '2017-01-01 00:05:00'})
      expect(stop.name()).to(eq("Burnside"))
    end
  end

  describe("#find_stops_for_city") do
    it("lets you find all of the stops in a particular city") do
      city1 = City.new({:name => "Portland", :id => nil})
      city1.save()
      city2 = City.new({:name => "Seattle", :id => nil})
      city2.save()
      train1 = Train.new({:name => "Midnight Express", :id => 5, :type => "Ghost Train"})
      train1.save()
      train2 = Train.new({:name => "Silver Bullet", :id => 5, :type => "Bullet Train"})
      train2.save()
      stop1 = Stop.new({:id => 1, :name => "Blue", :city_id => city1.id, :train_id => train1.id, :time => '2017-01-01 00:05:00'})
      stop1.save()
      stop2 = Stop.new({:id => 2, :name => "Red", :city_id => city2.id, :train_id => train2.id, :time => '2017-01-01 00:05:00'})
      stop2.save()
      expect(Stop.find_stops_for_city(city1.id)).to(eq([stop1]))
    end
  end

  describe("#find_stops_for_train") do
    it("lets you find all of the stops in a particular city") do
      city1 = City.new({:name => "Portland", :id => nil})
      city1.save()
      city2 = City.new({:name => "Seattle", :id => nil})
      city2.save()
      train1 = Train.new({:name => "Midnight Express", :id => 5, :type => "Ghost Train"})
      train1.save()
      train2 = Train.new({:name => "Silver Bullet", :id => 5, :type => "Bullet Train"})
      train2.save()
      stop1 = Stop.new({:id => 1, :name => "Blue", :city_id => city1.id, :train_id => train1.id, :time => '2017-01-01 00:05:00'})
      stop1.save()
      stop2 = Stop.new({:id => 2, :name => "Red", :city_id => city2.id, :train_id => train2.id, :time => '2017-01-01 00:05:00'})
      stop2.save()
      stop3 = Stop.new({:id => 3, :name => "Green", :city_id => city1.id, :train_id => train2.id, :time => '2017-01-01 00:05:00'})
      stop3.save()
      expect(Stop.find_stops_for_train(train2.id)).to(eq([stop2, stop3]))
    end
  end

end
