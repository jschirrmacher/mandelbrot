<?php
define("BAILOUT", 16);
define("MAX_ITERATIONS", 10000);

class Mandelbrot
{
	function iterate($x,$y)
	{
		$cr = $y-0.5;
		$ci = $x;
		$zi = 0.0;
		$zr = 0.0;
		$i = 0;
		while (true) {
			$i++;
			$temp = $zr * $zi;
			$zr2 = $zr * $zr;
			$zi2 = $zi * $zi;
			$zr = $zr2 - $zi2 + $cr;
			$zi = $temp + $temp + $ci;
			if ($zi2 + $zr2 > BAILOUT)
				return $i;
			if ($i > MAX_ITERATIONS)
				return 0;
		}
	}

	function Mandelbrot()
	{
		$output = '';
		$d1 = microtime(1);
		for ($y = -99; $y < 99; $y++) {
			for ($x = -99; $x < 99; $x++) {
				if ($this->iterate($x/100.0,$y/100.0) == 0) 
					$output .= "*";
				else
					$output .= " ";
			}
			$output .= "\n";
		}
		$d2 = microtime(1);
		$diff = $d2 - $d1;
		printf("%s\nPHP %s Elapsed %0.6f", $output, phpversion('tidy'), $diff);
	}
}

$m = new Mandelbrot();
