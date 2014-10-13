module FactoryHelpers

  def create_train_and_seats
    train = Train.create!( :name => "123")
    train.seats.create!( :name => "1A")
    train.seats.create!( :name => "2B")
    train
  end

end
