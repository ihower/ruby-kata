class TrainsController < ApplicationController

  def show
    @train = Train.find( params[:id] )

    render :text => "OK"
  end

end
