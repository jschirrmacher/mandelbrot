# Mandelbrot - a simple language benchmark

Runs a computation of the Mandelbrot set in various languages. The variants are designed to be more or less equivalent, printing the output only at the end to reduce the dependency of I/O to a minimum. Thus, only FP comuputation is measured.

To just run the tests for all available languages, simply call `./runAll.sh`

To try a single language, do the following steps:

1. Run `<language>/prepare.sh` (if such exists - interpreted languages doesn't require to call a compiler)

2. Run `<language>/run.sh`

Naturally, you need to install a compiler and runtime environment for each language you want to use. The `prepare` script calls the compiler with the required parameters, the `run` script executes the program in the desired language and prints out the elapsed time.

I tested on my available MacBook Pros (2014 and 2020) and the output looks like this:

--------------------------------------------------
Intel® Core™ i5-4288U 4 cores @2.60GHz
--------------------------------------------------
C gcc 4.2.1                                  0.668
JavaScript Node.js v12.13.0                  0.698
C# 3.1.102                                   1.692
Go go1.14                                    1.798
Java 1.8.0_121                               1.801
PHP 7.3.11                                  12.576
Ruby 2.6.0                                  22.782
Python 2.7.16                               49.591
Perl v5.18.4                               109.905

--------------------------------------------------
Intel® Core™ i5-8279U 8 cores @2.40GHz
--------------------------------------------------
C gcc 4.2.1                                  0.539
JavaScript Node.js v12.16.1                  0.545
Java                                         0.745
C# 3.1.102                                   1.058
Go go1.14                                    1.642
PHP 7.3.11                                   9.297
Ruby 2.6.3                                  16.659
Python 2.7.16                               36.193
Perl v5.18.4                                80.353
