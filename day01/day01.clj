(ns day01
  (:require [clojure.string :as str]))

(defn split-group [s]
  (str/split s #"\n\n"))

(defn sum-str-seq [str-seq]
  (let [s (str/split-lines str-seq)
        si (map #(Integer/parseInt %) s)] 
    (reduce + si)))
 
(def three-highest-calorie-sums
  (->>
   (slurp "day01/input")
   (split-group)
   (map sum-str-seq)
   (sort)
   (take-last 3)))

(last three-highest-calorie-sums)
(reduce + three-highest-calorie-sums)
