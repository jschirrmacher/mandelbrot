# Mandelbrot - a simple language benchmark

Run a computation of the Mandelbrot set in various languages. The variants are designed to be more or less equivalent, printing the output only at the end to reduce the dependency of I/O to a minimum. Thus, only FP comuputation is measured.

To just run the tests for all available languages, simply call `./runAll.sh`

To try a single language, do the following steps:

1. Run `<language>/prepare.sh` (if such exists - interpreted languages doesn't require to call a compiler)

2. Run `<language>/run.sh`

Naturally, you need to install a compiler and runtime environment for each language you want to use. The `prepare` script calls the compiler with the required parameters, the `run` script executes the program in the desired language and prints out the elapsed time.

On my Macbook Pro 2017, the output of `runAll.sh` is like that:

    C Elapsed 0.927386
    Java Elapsed 0.757
    JavaScript Node.js v12.14.1 Elapsed 0.739
    Perl v5.18.4 Elapsed 85.4472191333771
    PHP 7.3.9 Elapsed 9.605306
    Python 2.7.16 Elapsed 48.3249
    Ruby 2.6.3 Elapsed 19.224882
