# Creatures

# Each creature has a power and toughness. We will represent this in an array. [2, 3] means this creature has a power of 2 and a toughness of 3.

# When two creatures square off, they each deal damage equal to their power to each other at the same time. If a creature takes on damage greater than or equal to their toughness, they die.

# Examples:

#     Creature 1 - [2, 3]
#     Creature 2 - [3, 3]
#     Creature 3 - [1, 4]
#     Creature 4 - [4, 1]

# If creature 1 battles creature 2, creature 1 dies, while 2 survives. If creature 3 battles creature 4, they both die, as 3 deals 1 damage to 4, but creature 4 only has a toughness of 1.

# Write a function battle(player1, player2) that takes in 2 arrays of creatures. Each players' creatures battle each other in order (player1[0] battles the creature in player2[0]) and so on. If one list of creatures is longer than the other, those creatures are considered unblocked, and do not battle.

# Your function should return an object (a hash in Ruby) with the keys player1 and player2 that contain the power and toughness of the surviving creatures.

# Example:

# player1 = [[1, 1], [2, 1], [2, 2], [5, 5]];
# player2 = [[1, 2], [1, 2], [3, 3]];
# battle(player1, player2) # { player1: [[5, 5]], player2: [[1, 2], [3, 3]] }

def battle(player1, player2)
  #binding.pry
  player1_toughness = player1.map {|creature| creature[creature.length - 1]}
  player1_power = player1.map {|creature| creature[0]}
  
  player2_toughness = player2.map {|creature| creature[creature.length - 1]}
  player2_power = player2.map {|creature| creature[0]}
  
  
  num_of_battles = (player1.length >= player2.length ? player1.length : player2.length) - 1
  
  i = 0
  
  while i < num_of_battles
   
    player2.shift if player1_power[i] >= player2_toughness[i]
    player1.shift if player2_power[i] >= player1_toughness[i]
    i+=1
    
  end
  
  {player1:player1, player2:player2}
  
end

puts battle([[1, 1], [2, 1], [2, 2], [5, 5]], [[1, 2], [1, 2], [3, 3]])