require 'rails_helper'

RSpec.describe Train, :type => :model do

  it "should not be valid if blank name" do
    expect(Train.new).to_not be_valid
  end

  it "should be valid if it has name" do
    train = Train.new( :name => "Q_Q")
    expect(train).to be_valid
  end

end
