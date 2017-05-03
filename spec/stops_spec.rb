require("spec_helper")

describe(Stop) do

  describe(".all") do
    it("is empty at first") do
      expect(Stop.all()).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same stop if it has the same name") do
      stop1 = Stop.new({:id => 1, :name => "Blue", :city_id => 1, :train_id => 1, :time => '2017-01-01 00:05:00'})
      stop2 = Stop.new({:id => 2, :name => "Red", :city_id => 2, :train_id => 3, :time => '2017-01-01 00:05:30'})
      stop3 = Stop.new({:id => 1, :name => "Blue", :city_id => 1, :train_id => 1, :time => '2017-01-01 00:05:00'})
      expect(stop1==stop3).to(eq(true))
    end
  end

  describe('#save') do
    it("adds a stop to the array of saved stops") do
      test_stop = Stop.new({:id => 27, :name => "Blue", :city_id => 1, :train_id => 1, :time => '2017-01-01 00:05:00'})
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



end
