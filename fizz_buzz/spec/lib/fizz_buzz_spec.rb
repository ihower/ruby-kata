require_relative "../../lib/fizz_buzz"

describe FizzBuzz do

  let(:converter){ converter = FizzBuzz.new }

  it "should convert 1 to 1" do
    expect( converter.convert(1) ).to eq 1
  end

  it "should convert 3 to fizz" do
    expect( converter.convert(3) ).to eq "Fizz"
  end

  it "should convert 5 to buzz" do
    expect( converter.convert(5) ).to eq "Buzz"
  end

  it "should convert 15 to FizzBuzz" do
    expect( converter.convert(15) ).to eq "FizzBuzz"
  end

end