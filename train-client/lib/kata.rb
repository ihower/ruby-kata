require 'rest-client'

class TrainClient

  ENDPOINT = "http://localhost:3000"

  def query(train_id)
    json = RestClient.get(ENDPOINT + "/trains/#{train_id}")
    JSON.parse( json )
  end

  def reserve(train_id, seat_id)
    post_data = {
      "seat_id" => seat_id
    }
    json = RestClient.post(ENDPOINT + "/trains/#{train_id}/reservation", post_data)
    JSON.parse( json )
  end

end