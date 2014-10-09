require_relative "../../lib/kata"

describe "Kata" do

  let(:m) { Converter.new }

  example {
    expect( m.convert(1) ).to eq("I")
  }

  example {
    expect( m.convert(2) ).to eq("II")
  }

  example {
    expect( m.convert(5) ).to eq("V")
  }

  example {
    expect( m.convert(6) ).to eq("VI")
  }

  example {
    expect( m.convert(10) ).to eq("X")
  }

  example {
    expect( m.convert(20) ).to eq("XX")
  }

  example {
    expect( m.convert(4) ).to eq("IV")
  }

  example {
    expect( m.convert(9) ).to eq("IX")
  }


end