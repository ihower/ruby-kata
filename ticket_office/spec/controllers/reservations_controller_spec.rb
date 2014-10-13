require 'rails_helper'

RSpec.describe ReservationsController, :type => :controller do

  describe "POST create" do

    before do
      @train = Train.create!( :name => "123")
      @train.seats.create!( :name => "1A")
      @train.seats.create!( :name => "2B")
    end

    it "should reserve seats" do
      post :create, :train_id => @train.id, :seat => "2B", :email => "ihower@gmail.com"

      r = Reservation.last

      expect(response.body).to eq( { "reservation_id" => r.id }.to_json )
      expect(response).to have_http_status(200)
    end

  end

end
