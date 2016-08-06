def is_leap? year
  year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
end

def sunday_count
  days = [31,59,90,120,151,181,212,243,273,304,334,365]
  leap_days = [31,60,91,121,152,182,213,244,274,305,335,366]
  count = 0
  day = 0
  (1900..2000).each do |year|
    until day >= (is_leap?(year) ? 366 : 365) do
      day += 7
      if is_leap?(year)
        #count += 1 if leap_days.include?(day) && year != 1900
        if leap_days.include?(day) && year != 1900
          count += 1
          print [day, year]
          puts ""
        end
      else
        #count += 1 if days.include?(day) && year != 1900 
        if days.include?(day) && year != 1900
          count += 1
          print [day, year]
          puts ""
        end
      end
    end
    day = (is_leap?(year) ? day - 366 : day - 365)
  end
  count
end