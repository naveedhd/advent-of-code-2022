import std/strutils
import std/sequtils
import std/algorithm
import std/sugar

let filename = "./input"
var calorieSums = collect:
  for item in filename.readFile.split("\n\n"):
    item.splitLines.map(parseInt).foldl(a + b)

calorieSums.sort()

echo calorieSums[calorieSums.high]
echo calorieSums[calorieSums.high] + calorieSums[calorieSums.high - 1] + calorieSums[calorieSums.high - 2]

## Answers
## 70296
## 205381
