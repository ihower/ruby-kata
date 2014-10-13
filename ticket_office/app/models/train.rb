class Train < ActiveRecord::Base

  validates_presence_of :name

  has_many :seats

  def seats_by_date
    self.seats.map do |s|
      r = s.seat_reservations.last
      { "id" => s.name, "reservation_id" => r.try(:id) }
    end
  end

end
