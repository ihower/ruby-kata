class Train < ActiveRecord::Base

  validates_presence_of :name

  has_many :seats

  def seats_by_date
    self.seats.map do |s|
      r = s.seat_reservations.last
      { "id" => s.name, "reservation_id" => r.try(:id) }
    end
  end

  def reserve(email, seat)
    r = Reservation.create!( :email => email )
    s = self.seats.find_by_name(seat)

    if s
      s.seat_reservations.create!( :reservation => r)
      r
    else
      raise ActiveRecord::RecordNotFound
    end
  end

end
