# Mandelbrot - a simple language benchmark

Runs a computation of the Mandelbrot set in various languages. The variants are designed to be more or less equivalent, printing the output only at the end to reduce the dependency of I/O to a minimum. Thus, only FP comuputation is measured.

To just run the tests for all available languages, simply call `./runAll.sh`

To try a single language, do the following steps:

1. Run `<language>/prepare.sh` (if such exists - interpreted languages doesn't require to call a compiler)

2. Run `<language>/run.sh`

Naturally, you need to install a compiler and runtime environment for each language you want to use. The `prepare` script calls the compiler with the required parameters, the `run` script executes the program in the desired language and prints out the elapsed time.

I tested on my available MacBook Pros (2014 and 2020) and the output looks like this:

```text
--------------------------------------------------
Intel® Core™ i5-4288U 4 cores @2.60GHz
--------------------------------------------------
C gcc 4.2.1                                  0.668
JavaScript Node.js v12.13.0                  0.698
C# 3.1.102                                   0.937
Java 13.0.2                                  1.630
Go go1.14                                    1.798
PHP 7.4.3                                   11.610
Ruby 2.6.0                                  22.782
Python 3.7.7                                57.578
Perl v5.30.1                                99.630
```

```text
--------------------------------------------------
Intel® Core™ i5-8279U 8 cores @2.40GHz
--------------------------------------------------
C gcc 11.0.3                                 0.562
JavaScript Node.js v12.16.3                  0.568
Deno 1.0.0                                   0.576
C# 3.1.102                                   0.759
Java 13.0.2                                  0.773
Go go1.14                                    1.659
PHP 7.3.11                                   9.513
Ruby 2.6.3                                  16.940
Python 2.7.16                               36.193
Python 3.7.3                                40.375
Perl v5.30.1                                64.973
```
