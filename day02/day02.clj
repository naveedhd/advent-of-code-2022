(ns day02
  (:require [clojure.string :as str]))


(def filename "day02/input")

(def lines (str/split-lines (slurp filename)))

(def Rock     1)
(def Paper    2)
(def Scissors 3)

(def Lose 0)
(def Draw 3)
(def Win  6)

(def rulesOne {"A X" (+ Rock Draw)
		       "B X" (+ Rock Lose)
		       "C X" (+ Rock Win)
               "A Y" (+ Paper Win)
		       "B Y" (+ Paper Draw)
		       "C Y" (+ Paper Lose)
		       "A Z" (+ Scissors Lose)
		       "B Z" (+ Scissors Win)
		       "C Z" (+ Scissors Draw)}) 

(def rulesTwo {"A X" (+ Scissors Lose)
		       "B X" (+ Rock Lose)
		       "C X" (+ Paper Lose)
		       "A Y" (+ Rock Draw)
		       "B Y" (+ Paper Draw)
		       "C Y" (+ Scissors Draw)
		       "A Z" (+ Paper Win) 
               "B Z" (+ Scissors Win)
		       "C Z" (+ Rock Win)})

(reduce + (map rulesOne lines))
(reduce + (map rulesTwo lines))