
import std/strscans
import std/tables
import std/strutils
import std/sequtils


let filename = "./input"


var dirpath: seq[string]
var dirsizes = initTable[string, int]()

for line in filename.lines:
    
  var 
    directorychange: string
    size: int
    file: string


  if scanf(line, "$$ cd $+", directorychange):
    # go up
    if directorychange == "..":
      discard dirpath.pop
    # go in
    else:
      dirpath.add(directorychange)

  elif scanf(line, "$i $+", size, file):
    for i in 0 .. dirpath.high:
      let d =  dirpath[0..i].join("/")      
      if not dirsizes.hasKey(d):
        dirsizes[d] = 0
      dirsizes[d] += size

echo dirsizes
      .values
      .toSeq
      .filter(proc (v: int): bool = v <= 100000)
      .foldl(a + b)


let
  totalSize = 70000000
  usedSize = dirsizes["/"]
  freeSize = totalSize - usedSize
  requiredSize = 30000000 - freeSize

echo dirsizes
  .values
  .toSeq
  .filter(proc (v: int): bool = v > requiredSize)
  .min()


## Answers
## 1583951
## 214171