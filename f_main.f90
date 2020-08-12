program main


    use f_xoshiro

    integer(8) :: x, res, a, b, v
    integer(8), dimension(4) :: seed
    integer(4) :: k

    ! Test random number generation
    seed = (/47518962306516675_8, -2538253788509856973_8, -6761762193288716874_8, 4521037334260557993_8/)
    call xoshiro_seed(seed)
    v = next()
    print *, ""
    print *, "1st random number: ", v

    print *, ""
    v = next()
    print *, "2nd random number: ", v    

    call jump()
    print *, ""
    v = next()
    print *, "3rd random number: ", v

    print *, ""
    v = next()
    print *, "4th random number: ", v

    print *, ""
    v = next()
    print *, "5th random number: ", v

    print *, ""
    v = next()
    print *, "6th random number: ", v

    print *, ""
    v = next()
    print *, "7th random number: ", v

    print *, ""
    v = next()
    print *, "8th random number: ", v

    print *, ""
    v = next()
    print *, "9th random number: ", v

    print *, ""
    v = next()
    print *, "10th random number: ", v

    call jump()
    print *, ""
    v = next()
    print *, "11th random number: ", v

    call jump()
    print *, ""
    v = next()
    print *, "12th random number: ", v

    call jump()
    print *, ""
    v = next()
    print *, "13th random number: ", v

    call long_jump()
    print *, ""
    v = next()
    print *, "14th random number: ", v

    call long_jump()
    print *, ""
    v = next()
    print *, "15th random number: ", v

    do i = 1,100
        call long_jump()
    end do

    call long_jump()
    print *, ""
    v = next()
    print *, "16th random number: ", v

!
end program main
