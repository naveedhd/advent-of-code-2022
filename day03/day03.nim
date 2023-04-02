import std/strutils
import sequtils

let filename = "./input"

# part 1
# var priority_sum: int
# for line in filename.lines:
#   let line_len = line.len
#   let mid = line_len div 2

#   var common: char
#   block findcommonblock:
#     for i in 0 ..< mid:
#       for j in mid ..< line_len:
#         if line[i] == line[j]:
#           common = line[i]
#           break findcommonblock
  
#   var priority: int
#   if common.isUpperAscii:
#     priority_sum += ord(common) - 38
#   else:
#     priority_sum += ord(common) - 96 

# echo priority_sum


# part 2
var priority_sum: int
var groupsSet: set[char]
var i = 0
for line in filename.lines:
  i += 1  
  var lineSet: set[char]
  for c in line:
    lineSet.incl(c)

  if i == 1:
    groupsSet = lineSet
  else:
    groupsSet = groupsSet * lineSet

  if i == 3:
    let common = groupsSet.toSeq[0]
    if common.isUpperAscii:
      priority_sum += ord(common) - 38
    else:
      priority_sum += ord(common) - 96 
    i = 0

echo priority_sum

## Answers
## 7674
## 2805