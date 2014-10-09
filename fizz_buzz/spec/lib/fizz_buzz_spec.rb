require_relative "../../lib/fizz_buzz"

describe FizzBuzz do

  it "should convert 1 to 1" do
    converter = FizzBuzz.new

    expect( converter.convert(1) ).to eq 1
  end

end