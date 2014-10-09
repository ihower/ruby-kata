class BowlingGame

  def initialize
    @record =0
  end

  def roll_many(*n)
    n.each do |i|
      roll(i)
    end
  end

  def roll(n)
    @record += n
  end

  def score
    @record
  end

end