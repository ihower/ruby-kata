require 'rails_helper'

RSpec.describe Train, :type => :model do

  it "should not be valid if blank name" do
    expect(Train.new).to_not be_valid
  end

  it "should be valid if it has name" do
    train = Train.new( :name => "Q_Q")
    expect(train).to be_valid
  end


  describe ".seats_by_date" do
    before do
      @train = Train.create!( :name => "123")
      @s1 = @train.seats.create!( :name => "1A")
      @s2 = @train.seats.create!( :name => "2B")

      @reservation = Reservation.create!( :email => "ihower@gmail.com")

      SeatReservation.create!( :seat => @s1, :reservation => @reservation)
    end

    it "should return seats data" do
      data = [
        { "id" => @s1.name, "reservation_id" => @reservation.id },
        { "id" => @s2.name, "reservation_id" => nil }
      ]

      expect( @train.seats_by_date ).to eq(data)
    end
  end

end
