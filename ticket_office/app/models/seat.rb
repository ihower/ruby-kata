class Seat < ActiveRecord::Base

  belongs_to :train

  has_many :seat_reservations
  has_many :reservations, :through => :seat_reservations
end
