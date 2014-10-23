require 'csv'
class Train < ActiveRecord::Base

  class SoldOutError < StandardError
  end

  validates_presence_of :name

  has_many :seats

  def self.import_csv(filename)
    successful = 0
    failed = 0
    CSV.read(filename).each do |row|
      train = self.create( :name => row[0] )
      if train.save
        successful += 1
      else
        failed += 1
      end
    end

    { :successful => successful, :failed => failed }
  end

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
