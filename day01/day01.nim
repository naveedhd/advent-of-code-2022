import std/strutils
import std/algorithm

let filename = "./input"

var calorieSums: seq[int]
var currentSum = 0

for line in filename.lines:
  if line.isEmptyOrWhiteSpace:
    calorieSums.add(current_sum)
    currentSum = 0
  else:
    currentSum += line.parseInt

calorieSums.sort()

echo calorieSums[calorieSums.high]
echo calorieSums[calorieSums.high] + calorieSums[calorieSums.high - 1] + calorieSums[calorieSums.high - 2]

## Answers
## 70296
## 205381
