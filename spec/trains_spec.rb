require("spec_helper")

describe("trains") do

  describe(".all") do
    it("starts off with no trains") do
      expect(Train.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you the trains's name") do
      train = Train.new({:name => "Midnight Express", :id => nil, :type => "Ghost Train"})
      expect(train.name()).to(eq("Midnight Express"))
    end
  end

  describe("#type") do
    it("tells you the trains's type") do
      train = Train.new({:name => "Midnight Express", :id => nil, :type => "Ghost Train"})
      expect(train.type()).to(eq("Ghost Train"))
    end
  end

  describe("#==") do
    it("is the same train if it has the same name and id and type") do
      train1 = Train.new({:name => "Midnight Express", :id => 5, :type => "Ghost Train"})
      train2 = Train.new({:name => "Midnight Express", :id => 5, :type => "Ghost Train"})
      expect(train1).to(eq(train2))
    end
  end

  describe("#save") do
    it("lets you save the train to the database") do
      train1 = Train.new({:name => "Silver Bullet", :id => 5, :type => "Bullet Train"})
      train1.save()
      expect(Train.all()).to(eq([train1]))
    end
  end

  describe("#id") do
    it("sets trains's ID when you save it") do
      train = Train.new({:name => "Midnight Express", :id => 5, :type => "Ghost Train"})
      train.save()
      expect(train.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".find") do
    it("returns a train its ID") do
      train1 = Train.new({:name => "Midnight Express", :id => 5, :type => "Ghost Train"})
      train1.save()
      train2 = Train.new({:name => "Silver Bullet", :id => 5, :type => "Bullet Train"})
      train2.save()
      expect(Train.find(train2.id())).to(eq(train2))
    end
  end

  describe("#stops") do
    it("returns an array of stops for this train") do
      train1 = Train.new({:name => "Midnight Express", :id => 1, :type => "Ghost Train"})
      train1.save()
      stop2 = Stop.new({:id => 2, :name => "Red", :city_id => 2, :train_id => train1.id(), :time => '2017-01-01 00:05:30'})
      stop2.save()
      stop3 = Stop.new({:id => 1, :name => "Blue", :city_id => 1, :train_id => train1.id(), :time => '2017-01-01 00:05:00'})
      stop3.save()
      expect(train1.stops(train1.id())).to(eq([stop2, stop3]))
    end
  end



end
