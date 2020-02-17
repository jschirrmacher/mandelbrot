package main

import (
	"fmt"
	"time"
	"runtime"
)

const BAILOUT = 16
const MAX_ITERATIONS = 10000

func iterate(x float64, y float64) int {
	var cr, ci, zi, zr float64 = y-0.5, x, 0, 0
	var i = 0
	for {
		i++
		var temp = zr * zi
		var zr2 = zr * zr
		var zi2 = zi * zi
		zr = zr2 - zi2 + cr
		zi = temp + temp + ci
		if (zi2 + zr2 > BAILOUT) {
			return i
		} else if (i > MAX_ITERATIONS) {
			return 0
		}
	}
}

func main() {
	var startTime = time.Now()
	var output = ""

	for y := -99; y <= 99; y++ {
		for x := -99; x <= 99; x++ {
			if (iterate(float64(x) / 100, float64(y) / 100) == 0) {
				output += "*"
			} else {
				output += " "
			}
		}
		output += "\n"
	}
	var diff = time.Now().Sub(startTime)
	fmt.Println(output + "\nGo " + runtime.Version() + " Elapsed " + (diff + time.Second).String())
}
