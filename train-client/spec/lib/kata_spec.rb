require_relative "../../lib/kata"

describe TrainClient do

  let(:client){ TrainClient.new }

  describe "Query train's seats data" do
    it "should return seats data" do
      data = [
        { "id" => "1A", "reservation_id" => 1 },
        { "id" => "1B", "reservation_id" => 2 },
        { "id" => "1C", "reservation_id" => nil },
      ]

      train_id = "Train-123"

      expect(RestClient).to receive(:get).with("http://localhost:3000/trains/#{train_id}").and_return( JSON.generate(data) )

      expect( client.query(train_id) ).to eq(data)
    end
  end

  describe ".reserve" do
    it "should reserve a seat" do
      response_data = {
        "reservation_id" => 123,
        "train_id" => "Train-123"
      }
      post_data = {
        "seat_id" => "2B"
      }
      train_id = "Train-123"
      expect(RestClient).to receive(:post).with("http://localhost:3000/trains/#{train_id}/reservation", post_data).and_return( JSON.generate(response_data) )
      expect( client.reserve(train_id, "2B") ).to eq(response_data)
    end
  end

end