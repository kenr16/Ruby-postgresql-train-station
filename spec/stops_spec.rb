require("spec_helper")

describe(Stop) do

  describe(".all") do
    it("is empty at first") do
      expect(Stop.all()).to(eq([]))
    end
  end

  # describe('#==') do
  #   it("is the same patient if it has the same name") do
  #     patient1 = Patient.new({:name => "Mark Jones", :doctor_id => 1, :birthday => "2008-11-11"})
  #     patient2 = Patient.new({:name => "Mark Jones", :doctor_id => 1, :birthday => "2008-11-11"})
  #     expect(patient1==patient2).to(eq(true))
  #   end
  # end


end
