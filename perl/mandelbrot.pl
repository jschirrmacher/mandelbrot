$BAILOUT=16;
$MAX_ITERATIONS=10000;

use Time::HiRes qw(gettimeofday);
($epochseconds, $microseconds) = gettimeofday;
$begin = $epochseconds + $microseconds / 1000000;

sub mandelbrot {
       local $x = $_[0];
       local $y = $_[1];

       local $cr = $y - 0.5;
       local $ci = $x;
       local $zi = 0.0;
       local $zr = 0.0;
       local $i = 0;

       while (1) {
               $i = $i + 1;
               local $temp = $zr * $zi;
               local $zr2 = $zr * $zr;
               local $zi2 = $zi * $zi;
               $zr = $zr2 - $zi2 + $cr;
               $zi = $temp + $temp + $ci;
               if ($zi2 + $zr2 > $BAILOUT) {
                       return $i;
               }
               if ($i > $MAX_ITERATIONS) {
                       return 0;
               }
       }
}

$output = '';
for ($y = -99; $y < 99; $y++) {
       for ($x = -99; $x < 99; $x++) {
               $i = mandelbrot($x/100.0, $y/100.0);
               if ($i == 0) {
                       $output .= "*";
               } else {
                       $output .= " ";
               }
       }
       $output .= "\n";
}

($epochseconds, $microseconds) = gettimeofday;
$endTime = $epochseconds + $microseconds / 1000000;
$end = $endTime - $begin;

print $output . "Perl $^V Elapsed $end\n";
