package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
)

func check(err error) {
	if err != nil {
		log.Fatalln(err)
	}
}

func main() {
	filename := "./input"
	file, err := os.Open(filename)
	check(err)
	defer file.Close()

	const Rock = 1
	const Paper = 2
	const Scissors = 3

	const Lose = 0
	const Draw = 3
	const Win = 6

	var rulesOne = map[string]int{
		"A X": Rock + Draw,
		"B X": Rock + Lose,
		"C X": Rock + Win,
		"A Y": Paper + Win,
		"B Y": Paper + Draw,
		"C Y": Paper + Lose,
		"A Z": Scissors + Lose,
		"B Z": Scissors + Win,
		"C Z": Scissors + Draw,
	}

	var rulesTwo = map[string]int{
		"A X": Scissors + Lose,
		"B X": Rock + Lose,
		"C X": Paper + Lose,
		"A Y": Rock + Draw,
		"B Y": Paper + Draw,
		"C Y": Scissors + Draw,
		"A Z": Paper + Win,
		"B Z": Scissors + Win,
		"C Z": Rock + Win,
	}

	scanner := bufio.NewScanner(file)
	var part1 = 0
	var part2 = 0
	for scanner.Scan() {
		key := scanner.Text()
		part1 += rulesOne[key]
		part2 += rulesTwo[key]
	}

	fmt.Println(part1)
	fmt.Println(part2)
}
