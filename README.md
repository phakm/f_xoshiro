# f_xoshiro
Fortran implementation of xoshiro256++ random number generator. The algorithm generates random 64-bit integers (integer(8)). See: http://prng.di.unimi.it/

## Installation

Compile the module:
```
gfortran -c f_xoshiro.f90
```

Compile the main program and link:
```
gfortran -c f_main.f90
gfortran -o f_main f_xoshiro.o f_main.o
```

## Usage

Use function `next` to get the next random number. 

If the generator is used in parallel `jump` and `long_jump` can be used to generate different starting points to achieve independent and non-overlapping sequences of random numbers. `jump` is equivalent to 2^128 calls to `next` and can be used to generate 2^128 starting points. `long_jump` is equivalent to 2^192 calls to `next` and can be used to generate 2^64 starting points.

Example program (f_main.f90)
```
program main

    use f_xoshiro

    integer(8), dimension(4) :: seed

    ! Set seed to random number generator
    seed = (/47518962306516675_8, -2538253788509856973_8, -6761762193288716874_8, 4521037334260557993_8/)
    call xoshiro_seed(seed)

    ! Call next function to get the next 64-bit random integer
    v = next()

    ! Use jump to jump 2^64 steps forward
    call jump()

    ! Use long_jump to jump 2^192 steps forward
    call long_jump()

end program main
```
## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)
