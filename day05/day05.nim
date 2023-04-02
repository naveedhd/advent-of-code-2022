import std/strutils
import std/strscans
import std/algorithm


var
  # example
  # stacks = @[
  #   @['Z', 'N'],
  #   @['M', 'C', 'D'],
  #   @['P']
  # ]

  # input
  stacks = @[
    @['F', 'T', 'C', 'L', 'R', 'P', 'G', 'Q'],
    @['N', 'Q', 'H', 'W', 'R', 'F', 'S', 'J'],
    @['F', 'B', 'H', 'W', 'P', 'M', 'Q'],
    @['V', 'S', 'T', 'D', 'F'],
    @['Q', 'L', 'D', 'W', 'V', 'F', 'Z'],
    @['Z', 'C', 'L', 'S'],
    @['Z', 'B', 'M', 'V', 'D', 'F'],
    @['T', 'J', 'B'],
    @['Q', 'N', 'B', 'G', 'L', 'S', 'P', 'H'],    
  ]

  moves: seq[seq[int]]
  
  # @[(1, 2, 1),
  #           (3, 1, 3),
  #           (2, 2, 1),
  #           (1, 1, 2)]

let filename = "./input"

for moveString in filename.readFile.split("\n\n")[1].split("\n"):
  var move: seq[int]
  var num, frm, to: int
  if not scanf(moveString, "move $i from $i to $i", num, frm, to):
    echo "Error parsing"
    quit(1)

  move = @[num, frm, to]
  moves.add(move)
  
for move in moves:
  let 
    num = move[0]
    frm = move[1] - 1
    to = move[2] - 1

  var topush: seq[char]
  for _ in 0 ..< num:
    
    let p = stacks[frm].pop()

    # part 1
    # stacks[to].add(p)

    # part 2
    topush.add(p)

  topush.reverse()
  for p in topush:
    stacks[to].add(p)



for stack in stacks:
  stdout.write stack[stack.high]

echo ""

  



# var eq = @[1, 2, 3]
# echo eq

# eq.add(4)
# echo eq


# let f = eq.pop()
# echo eq
# echo f



# const input = "move 1 from 2 to 1"
# var move, frm, to: int
# if scanf(input, "move $i from $i to $i", move, frm, to):
#   echo move, frm, to