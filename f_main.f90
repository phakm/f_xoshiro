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
