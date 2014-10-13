require "rails_helper"

RSpec.describe "Train Office", :type => :request do

  before do
    @train = create_train_and_seats
  end

  describe "workflow" do

    it "works!" do
      # step1: query
      get "/trains/#{@train.id}.json"
      expect(response.body).to eq(
        [
          { "id" => "1A", "reservation_id" => nil},
          { "id" => "2B", "reservation_id" => nil},
        ].to_json
      )
      expect(response).to have_http_status(200)

      # step2: reserve
      post "/trains/#{@train.id}/reservations.json", { :email => "ihower@gmail.com", :seat => "1A"}
      r = Reservation.last
      expect(response.body).to eq(
        { :reservation_id => r.id }.to_json
      )

      # step3: query
      get "/trains/#{@train.id}.json"
      expect(response.body).to eq(
        [
          { "id" => "1A", "reservation_id" => r.id},
          { "id" => "2B", "reservation_id" => nil},
        ].to_json
      )

    end

  end

end