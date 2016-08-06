require "pry"
def group_by_three num 
  result = []
  while num / 100 > 0
    result.unshift(num % 1000)
    num /= 1000
  end
  result.unshift(num) if num > 0
  result 
end

def in_words num
  ones = %w{ one two three four five six seven eight nine }
  teens = %w{ eleven twelve thirteen fourteen fifteen sixteen seventeen 
                eighteen nineteen }
  tens = %w{ ten twenty thirty forty fifty sixty seventy eighty ninety }
  
  word = ""
  groups = group_by_three num 
  while groups.length > 0 
    group = groups.first
    while group > 0 
      if group / 100 > 0
        word += ones[group / 100 - 1] + 'hundred' + (group % 100 == 0 ? '' : 'and')
        group -= (group / 100) * 100
      elsif group / 10 > 0
        if group / 10 == 1 && group != 10
          word += teens[group % 10 - 1]
          group = 0
        else
          word += tens[group / 10 - 1]
          group -= (group / 10) * 10
        end
      else
        word += ones[group - 1] + (groups.length > 1 ? "thousand" : "")
        group = 0
      end
    end
    groups.shift
  end
  word
end

def num_letter_counts(min, max)
  (min..max).reduce("") { |str, num| str += in_words(num); str }.length   
end