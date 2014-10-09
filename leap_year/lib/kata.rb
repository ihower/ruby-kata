def is_leap_year?(y)
  if y % 4 == 0
    if y % 100 == 0
      if y % 400 == 0
        true
      else
        false
      end
    else
      true
    end
  end
end