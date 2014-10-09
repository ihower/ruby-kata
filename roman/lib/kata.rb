class Converter

  CONVERT_TABLE = [
    [10, "X"],
    [9, "IX"],
    [5, "V"],
    [4, "IV"],
    [1, "I"]
  ]

  def convert(n)
    result = ""

    CONVERT_TABLE.each do |i, r|
      while n >= i
        result += r
        n -= i
      end
    end

    result
  end

end