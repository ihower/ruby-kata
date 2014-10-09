require_relative "../../lib/kata"

describe BowlingGame do

  let(:game) { BowlingGame.new }

  context "first ball" do
    it "should score 1" do
      game.roll(1)
      expect(game.score).to eq(1)
    end
  end

  context "many ball" do
    it "should score 60" do
      game.roll_many(
        1,2,3,4,5,
        1,2,3,4,5,
        1,2,3,4,5,
        1,2,3,4,5
      )
      expect(game.score).to eq(60)
    end
  end

  xit "should score 90" do
      game.roll(1)
      game.roll("/")
      game.roll(1)
      game.roll(1)

      expect(game.score).to eq(12)
  end

end