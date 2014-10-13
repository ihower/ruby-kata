require 'rails_helper'

RSpec.describe ReservationsController, :type => :controller do

  describe "POST create" do

    before do
      @train = create_train_and_seats
    end

    it "should reserve seats" do
      post :create, :train_id => @train.id, :seat => "2B", :email => "ihower@gmail.com"

      r = Reservation.last

      expect(response.body).to eq( { "reservation_id" => r.id }.to_json )
      expect(response).to have_http_status(200)
    end

    it "should raise error if seat not found" do
      post :create, :train_id => @train.id, :seat => "99999", :email => "ihower@gmail.com"

      expect(response.body).to eq( { "error" => "not found" }.to_json )
      expect(response).to have_http_status(404)
    end

    it "should raise error if seat sold out" do
      allow(Train).to receive(:find).and_return(@train)
      allow(@train).to receive(:reserve).and_raise( Train::SoldOutError )

      post :create, :train_id => @train.id, :seat => "1A", :email => "ihower@gmail.com"

      expect(response.body).to eq( { "error" => "sold out" }.to_json )
      expect(response).to have_http_status(200)
    end
  end

end
