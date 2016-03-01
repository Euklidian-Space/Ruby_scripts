# Description:

# dataand data1 are two strings with rainfall records of a few cities for months from January to December. The records of towns are separated by \n. The name of each town is followed by :.

# data, data1 and towns can be seen in "Your Test Cases:".
# Task:

# - function: mean(town, strng) should return the average of rainfall for the city `town` and the `strng` `data` or `data1`.
# - function: variance(town, strng) should return the variance of rainfall for the city `town` and the `strng` `data` or `data1`.

# Examples:

# mean("London", data), 51.19(9999999999996) 
# variance("London", data), 57.42(833333333374)

# Notes:

# - if functions `mean`or `variance` have as parameter `town` a city which has no records return `-1`
# - Don't truncate or round: the tests will pass if `abs(your_result - test_result) <= 1e-2`.
# - <http://www.mathsisfun.com/data/standard-deviation.html>
# - `data` and `data1` are adapted from <http://www.worldclimate.com>

require 'byebug'

def data_scrub(town,str)
  town.length <= 2 ? norm_town = town.upcase : norm_town = town.capitalize
  data = str.split(/[\n]+/)
  record = data.find{|elem| elem.match( /\b#{norm_town}\b/)}
  return record.scan(/[-+]?[0-9]*\.?[0-9]+/).map{|measurement| measurement.to_f} if record
  nil
end

def mean(town,str)
  data = data_scrub(town,str)
  return -1 if data.nil?
  data.reduce(:+) / data.length
end

def variance(town,str)
  data = data_scrub(town,str)
  return -1 if data.nil?
  mu = mean(town,str)
  numerator = data.map{|x| (x - mu)*(x - mu)}.reduce(:+)
  numerator / data.length
end

