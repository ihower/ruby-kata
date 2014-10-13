require 'rails_helper'

RSpec.describe TrainsController, :type => :controller do

  describe "get show" do

    before do
      # Train = double("Train")
      @train = double("train", :id => "416", :name => "Train#416")
      allow(Train).to receive(:find).with(@train.id).and_return(@train)
    end

    it "should return train's seat data" do
      get :show, :id => 416, :format => :json

      expect(assigns(:train)).to eq(@train)
      #expect(response).to render_template(:show)
      expect(response).to have_http_status(200)
    end

  end

end
