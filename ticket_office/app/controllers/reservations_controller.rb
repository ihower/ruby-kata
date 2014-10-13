class ReservationsController < ApplicationController

  def create
    @train = Train.find( params[:train_id] )
    r = @train.reserve( params[:email], params[:seat] )

    rescue Train::SoldOutError
      render :json => { :error => "sold out" }
    else
      render :json => { :reservation_id => r.id }
  end

end
