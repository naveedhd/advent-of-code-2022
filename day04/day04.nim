import std/strutils

let filename = "./input"

var contain: int
var overlap: int
for line in filename.lines:
  let commaSplit = line.split(",")
  let firstInterval = commaSplit[0]
  let secondInterval = commaSplit[1]

  let firstSplit = firstInterval.split("-")
  let firstStart = firstSplit[0].parseInt
  let firstEnd = firstSplit[1].parseInt

  let secondSplit = secondInterval.split("-")
  let secondStart = secondSplit[0].parseInt
  let secondEnd = secondSplit[1].parseInt

  let firstIntervalLen = firstEnd - firstStart + 1
  let secondIntervalLen = secondEnd - secondStart + 1

  let higherIntervalLen = max(firstIntervalLen, secondIntervalLen)

  let lowestStart = min(firstStart, secondStart)
  let highestEnd = max(firstEnd, secondEnd)

  let biggestIntervalLen = highestEnd - lowestStart + 1

  if higherIntervalLen == biggestIntervalLen:
    contain += 1

  if not (firstEnd < secondStart or secondEnd < firstStart):
    overlap += 1

echo contain
echo overlap

## Answers
## 305
## 811