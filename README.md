# Mandelbrot - a simple language benchmark

Runs a computation of the Mandelbrot set in various languages. The variants are designed to be more or less equivalent, printing the output only at the end to reduce the dependency of I/O to a minimum. Thus, only FP comuputation is measured.

To just run the tests for all available languages, call `./runAll.sh` (you might need to [install some of the programming languages ](#install-programming-languages) first).

To try a single language, do the following steps:

1. Run `<language>/prepare.sh` (if such exists - interpreted languages doesn't require to call a compiler)

2. Run `<language>/run.sh`

Naturally, you need to install a compiler and runtime environment for each language you want to use. The `prepare` script calls the compiler with the required parameters, the `run` script executes the program in the desired language and prints out the elapsed time.

## Install programming languages

Most of the languages were already installed on my MacBooks or can be installed with [HomeBrew](https://brew.sh):

    brew install node deno php perl python go

Java and C# need a cask:

    brew install --cask temurin
    brew install --cask dotnet

## My results

I tested on several MacBook Pros and the output looks like this:

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

```text
--------------------------------------------------
Intel® Core™ i7-3667U 4 cores @2.00GHz
--------------------------------------------------
Deno 1.7.0                                   0.685
JavaScript Node.js v15.6.0                   0.693
C gcc 12.0.0                                 0.723
C# 5.0.102                                   0.923
Java 13.0.2                                  0.963
Go go1.15.7                                  1.801
PHP 7.3.11                                  20.613
Ruby 2.6.3                                  28.989
Python 3.8.2                                62.049
Perl v5.18.4                               144.465
```

```text
--------------------------------------------------
Intel® Core™ i7-7660U 4 cores @2.5GHz
--------------------------------------------------
C gcc 13.1.6                                 0.536
JavaScript Node.js v18.7.0                   0.553
Deno 1.24.3                                  0.570
Java 18.0.2                                  0.663
C# 6.0.400                                   0.717
Go go1.19                                    1.626
PHP 8.1.9                                    8.366
Ruby 2.6.8                                  18.758
Python 3.10.6                               36.016
Perl v5.34.0                                62.562
```
