class BowlingGame

  attr_reader :score

  def initialize
    @score = 0
    @record = []
  end

  def roll_many(*n)
    n.each do |i|
      roll(i)
    end
  end

  def roll(n)
    @record << n

    if n == "/"
      @score += ( 10 - previous_ball )
    else
      @score += n
    end
  end

  private

  def previous_ball
    @record[-2]
  end

end