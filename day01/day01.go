package main

import (
	"bytes"
	"fmt"
	"log"
	"os"
	"sort"
	"strconv"
)

func check(err error) {
	if err != nil {
		log.Fatalln(err)
	}
}

func main() {
	filename := "./input"
	body, err := os.ReadFile(filename)
	check(err)

	var calorieSums []int
	res := bytes.Split(body, []byte("\n\n"))
	for _, it := range res {
		var sum int
		for _, i := range bytes.Split(it, []byte("\n")) {
			num, err := strconv.Atoi(string(i))
			check(err)
			sum += num
		}
		calorieSums = append(calorieSums, sum)
	}

	sort.Ints(calorieSums)

	fmt.Println(calorieSums[len(calorieSums)-1])
	fmt.Println(calorieSums[len(calorieSums)-1] + calorieSums[len(calorieSums)-2] + calorieSums[len(calorieSums)-3])
}
