require("spec_helper")

describe("City") do
  describe(".all") do
    it("starts off with no cities") do
      expect(City.all()).to(eq([]))
    end
  end


end
