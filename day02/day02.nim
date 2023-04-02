import std/strutils


# let filename = "./example"
let filename = "./input"

# part 1
# var totalScore: int
# for line in filename.lines:
#   let splt = line.split(" ", 2)
#   var (opp, me) = (splt[0], splt[1])


#   # echo opp, ", ", me

#   # should we normalize first?
#   # for opponent: A -> rock, B -> paper, C => Scissors
#   if opp == "A":
#     opp = "R"
#   elif opp == "B":
#     opp = "P"
#   else:
#     opp = "S"

#   # for me: X -> rock, y -> paper, C => scissors
#   if me == "X":
#     me = "R"    
#   elif me == "Y":
#     me = "P"    
#   else:
#     me = "S"

#   # echo "---"
#   # echo opp, ", ", me

#   # now figure the result
#   var score: int
#   if opp == "R":
#     if me == "R":
#       score = 3
#     elif me == "P":
#       score = 6
#     else:  # "S"
#       score = 0
    
#   elif opp == "P":
#     if me == "R":
#       score = 0
#     elif me == "P":
#       score = 3
#     else:  # "S"
#       score = 6

#   else: # "S"
#     if me == "R":
#       score = 6
#     elif me == "P":
#       score = 0
#     else:  # "S"
#       score = 3

#   # echo "---"
#   # echo score

#   if me == "R":
#     score += 1 
#   elif me == "P":
#     score += 2 
#   else:  # "S"
#     score += 3 

#   # echo "---"
#   # echo score

#   # echo "------------------end"

#   totalScore += score

# echo totalScore

# part 2
var totalScore: int
for line in filename.lines:
  let splt = line.split(" ", 2)
  var (opp, me) = (splt[0], splt[1])

  echo opp, ", ", me
  
  # for opponent: A -> rock, B -> paper, C => Scissors
  if opp == "A":
    opp = "R"
  elif opp == "B":
    opp = "P"
  else:
    opp = "S"

  var outcome: string
  if me == "X":
    outcome = "lose"
  elif me == "Y":
    outcome = "draw"
  else:
    outcome = "win"

  echo "---"
  echo outcome

  # now figure the result
  # var score: int
  # if opp == "R":
  #   if me == "R":
  #     score = 3
  #   elif me == "P":
  #     score = 6
  #   else:  # "S"
  #     score = 0
    
  # elif opp == "P":
  #   if me == "R":
  #     score = 0
  #   elif me == "P":
  #     score = 3
  #   else:  # "S"
  #     score = 6

  # else: # "S"
  #   if me == "R":
  #     score = 6
  #   elif me == "P":
  #     score = 0
  #   else:  # "S"
  #     score = 3
  var score: int
  if outcome == "lose":
    score = 0
  elif outcome == "draw":
    score = 3
  else:  # win
    score = 6

  echo "---"
  echo score
  

  # out outcome will also change based on score
  if outcome == "lose":
    if opp == "R":
      me = "S"
    elif opp == "P":
      me = "R"
    else:  # S
      me = "P"    

  elif outcome == "draw":
    me = opp
    
  else:  # win
    if opp == "R":
      me = "P"
    elif opp == "P":
      me = "S"
    else:  # S
      me = "R"

  # echo "---"
  # echo score

  if me == "R":
    score += 1 
  elif me == "P":
    score += 2 
  else:  # "S"
    score += 3

  # echo "---"
  # echo score 

  totalScore += score

  echo "------------------end"

echo totalScore


  


  
 


## score on shape
## Rock     -> 1 
## Paper    -> 2
## Sciccors -> 3
## 
## Score on winning
## Lose -> 0
## Draw -> 3
## Win  -> 6
## 
## Rules
## Scissors < Rock 
## Paper < Scissors
## Rock < Paper 


## Answers
## 10310
## 14859