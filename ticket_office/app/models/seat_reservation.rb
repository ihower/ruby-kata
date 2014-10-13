class SeatReservation < ActiveRecord::Base

  belongs_to :seat
  belongs_to :reservation

end
