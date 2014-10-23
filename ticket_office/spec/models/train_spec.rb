require 'rails_helper'

RSpec.describe Train, :type => :model do

  it "should import CSV" do
    results = Train.import_csv("#{Rails.root}/spec/fixtures/trains.csv")

    expect(results[:successful]).to eq(3)
    expect(results[:failed]).to eq(1)

    target_train = Train.last
    expect(target_train.name).to eq("Train 104")
  end

  it "should not be valid if blank name" do
    expect(Train.new).to_not be_valid
  end

  it "should be valid if it has name" do
    train = Train.new( :name => "Q_Q")
    expect(train).to be_valid
  end

  before do
    @train = Train.create!( :name => "123")
    @s1 = @train.seats.create!( :name => "1A")
    @s2 = @train.seats.create!( :name => "2B")
  end

  describe ".reserve" do
    it "should reserva seat" do
      @train.reserve( "ihower@gmail.com", "2B")

      expect(SeatReservation.count).to eq(1)
      expect(Reservation.count).to eq(1)

      sr = SeatReservation.last
      s = Reservation.last

      expect(sr.reservation.email).to eq("ihower@gmail.com")
      expect(sr.seat).to eq(@s2)

    end
  end

  describe ".seats_by_date" do

    before do
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
