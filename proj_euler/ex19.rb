require "pry"

def is_leap? year
  year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
end

def cal_proto(year)
  {
    'jan' => Array.new(31),
    'feb' => Array.new(is_leap?(year) ? 29 : 28),
    'mar' => Array.new(31),
    'apr' => Array.new(30),
    'may' => Array.new(31),
    'jun' => Array.new(30),
    'jul' => Array.new(31),
    'aug' => Array.new(31),
    'sep' => Array.new(30),
    'oct' => Array.new(31),
    'nov' => Array.new(30),
    'dec' => Array.new(31)
  }  
end

def create_calender
  result = {}
  day = 2 #<---- First day of 1901 is a tuesday.  Day is modulo 7 
  (1901..2000).each do |year|
    cal = cal_proto(year) 
    cal.each do |k,v|
      0.upto(v.length - 1) do |i|
        v[i] = day 
        day = day < 6 ? day + 1 : 0
      end
    end
    result[year] = cal 
  end
  result
end

def sunday_count
  century = create_calender
  count = 0
  century.each do |year, cal| 
    count += cal.select { |k,v| v.first == 0 }.count      
  end
  count
end

#first version below.  It was a failure

# def sunday_count
#   days = [0,31,59,90,120,151,181,212,243,273,304,334]
#   leap_days = [0,31,60,91,121,152,182,213,244,274,305,335]
#   count = 0
#   day = 6
#   (1901..2000).each do |year|
#     until day >= (is_leap?(year) ? 366 : 365) do
#       day += 6
#       if is_leap?(year)
#         #count += 1 if leap_days.include?(day) && year != 1900
#         if leap_days.include?(day) #&& year != 1900
#           count += 1
#           print [day, year]
#           puts ""
#         end
#       else
#         #count += 1 if days.include?(day) && year != 1900 
#         if days.include?(day) #&& year != 1900
#           count += 1
#           print [day, year]
#           puts ""
#         end
#       end
#     end
#     day = (is_leap?(year) ? day - 366 : day - 365)
#   end
#   count
# end