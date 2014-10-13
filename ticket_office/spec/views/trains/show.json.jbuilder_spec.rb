# show.json.jbuilder_spec.rb
require "rails_helper"

RSpec.describe "trains/show", :type => :view do

  before do
    @data = [
      { "id" => "1A", "reservation_id" => 111},
      { "id" => "2A", "reservation_id" => nil},
    ]

    allow(@train).to receive(:seats_by_date).and_return(@data)
  end

  it "render train JSON API" do
    render
    train_hash = JSON.parse(rendered)
    expect(train_hash).to eq(@data)
  end

end

