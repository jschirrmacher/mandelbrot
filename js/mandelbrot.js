'use strict'

const BAILOUT = 16
const MAX_ITERATIONS = 10000

function mandelbrot(x, y) {
	let cr = y - 0.5
	let ci = x
	let zi = 0.0
	let zr = 0.0
	let i = MAX_ITERATIONS

	while (--i) {
		let temp = zr * zi
		let zr2 = zr * zr
		let zi2 = zi * zi
		zr = zr2 - zi2 + cr
		zi = temp + temp + ci
		if (zi2 + zr2 > BAILOUT) {
			return i
		}
	}
	return i
}

function mandelbrot_run() {
	let x
	let y
	let output = ''
	
	let date = new Date()
	for (y = -99; y < 99; y++) {
		for (x = -99; x < 99; x++) {
			output += mandelbrot(x/100.0, y/100.0) === 0 ? '*' : ' '
		}	
		output += "\n"
	}
	let date2 = new Date()
	return output + "\nJavaScript Node.js " + process.version + " Elapsed " + (date2.getTime() - date.getTime()) / 1000
}

console.log(mandelbrot_run())
