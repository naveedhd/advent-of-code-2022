# import std/strutils
import std/sequtils
import std/strutils


let filename = "./input"


var treeGrid: seq[seq[int]] 
for line in filename.lines:
  treeGrid.add line.items.toSeq.map(proc (x: char): int = parseInt($x))
# echo treeGrid

let 
  treeWidth = treeGrid.len
  treeHeight = treeGrid[0].len

var treeVisible: seq[seq[bool]]
  
for row in 0 ..< treeHeight:
  treeVisible.add newSeq[bool](treeWidth)


# traverse from left to right
for row in 0 ..< treeHeight:
  var highest = -1
  for col in 0 ..< treeWidth:
    let el = treeGrid[row][col]
    if el > highest:
      treeVisible[row][col] = true
      highest = el


# from right to left
for row in 0 ..< treeHeight:
  var highest = -1
  for col in countdown(treeWidth - 1, 0):
    let el = treeGrid[row][col]
    if el > highest:
      treeVisible[row][col] = true
      highest = el



# from top to bottom
for col in 0 ..< treeWidth:
  var highest = -1
  for row in 0 ..< treeHeight:
    let el = treeGrid[row][col]
    if el > highest:
      treeVisible[row][col] = true
      highest = el


# from bottom to top
for col in 0 ..< treeWidth:
  var highest = -1
  for row in countdown(treeHeight - 1, 0):
    let el = treeGrid[row][col]
    if el > highest:
      treeVisible[row][col] = true
      highest = el


var totalVisible = 0
for row in 0 ..< treeHeight:
  for col in 0 ..< treeWidth:
    if treeVisible[row][col]:
      inc totalVisible
echo totalVisible



# part 2
var treeScenic: seq[seq[int]]
for row in 0 ..< treeHeight:
  var scenic: seq[int]
  for col in 0 ..< treeWidth:
    scenic.add 1
  treeScenic.add scenic


for row in 1 ..< treeHeight - 1:
  for col in 1 ..< treeWidth - 1:
    # go left
    var distance = 1
    for left in countdown(col - 1, 1):
      if treeGrid[row][left] >= treeGrid[row][col]:
        break
      inc distance
    treeScenic[row][col] *= distance

    # go right
    distance = 1
    for right in countup(col + 1, treeWidth - 2):
      if treeGrid[row][right] >= treeGrid[row][col]:
        break
      inc distance
    treeScenic[row][col] *= distance

    # go top
    distance = 1
    for up in countdown(row - 1, 1):
      if treeGrid[up][col] >= treeGrid[row][col]:
        break
      inc distance
    treeScenic[row][col] *= distance

    # go bottom
    distance = 1
    for bottom in countup(row + 1, treeHeight - 2):
      if treeGrid[bottom][col] >= treeGrid[row][col]:
        break
      inc distance
    treeScenic[row][col] *= distance


var highestScenic = 0
for row in treeScenic:
  for col in row:
    if col > highestScenic:
      highestScenic = col
echo highestScenic


## Answers
## 1669
## 331344