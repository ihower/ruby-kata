class Reservation < ActiveRecord::Base

  has_many :seat_reservations
  has_many :seats, :through => :seat_reservations

end
