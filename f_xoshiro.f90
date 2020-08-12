!+ Module containing Fortran implementation of xoshiro256++
!    random number generator
module f_xoshiro

    implicit none

!-----------------------------------------------------------------------------
! Description:
!   Module containing Fortran implementation of xoshiro256++ algorithm.
!   
!   Translation of original C code written by David Blackman and Sebastiano Vigna.
!   More information on the algorithm and original C code: http://prng.di.unimi.it/
!
!   Author: Pasi Hakulinen, 12.08.2020
!
! Code Description:
!   Language: Fortran 90.
!-----------------------------------------------------------------------------

    integer(8), dimension(4) :: xoshiro_s

    private

    public xoshiro_s, rotl, u_add, xoshiro_seed, next, jump, long_jump

    contains
    
    subroutine xoshiro_seed(s_new)
        implicit none

        ! Subroutine arguments
        integer(8), dimension(4) :: s_new ! New seed to generator
        xoshiro_s = s_new
    end subroutine xoshiro_seed

    function rotl(x, k) result(res)
        implicit none

      ! Function arguments
        integer(8), intent(in) :: x
        integer(4), intent(in) :: k

      ! Function return type
        integer(8) :: res
        res = ior(shiftl(x, k) , (shiftr(x, (64 - k))))
      
    end function rotl

    function u_add(a, b) result(res)
        implicit none

      ! Function arguments
        integer(8), intent(in) :: a, b

      ! Function return type
        integer(8) :: res
        
      ! Local variables
        integer(8) :: carry, shiftedcarry

      ! Function
        carry = iand(a, b)
        res = ieor(a, b)
        do while (carry .ne. 0)
            shiftedcarry = shiftl(carry, 1)
            carry = iand(res, shiftedcarry)
            res = ieor(res, shiftedcarry)
        end do
    end function u_add

    function next() result(res)
        implicit none

      ! Function arguments

      ! Function return type
        integer(8) :: res

      ! Local variables
        integer(8) :: t

      ! Function
        res = rotl(u_add(xoshiro_s(1), xoshiro_s(4)), 23)
        res = u_add(res, xoshiro_s(1))

        t = shiftl(xoshiro_s(2), 17)
        
        xoshiro_s(3) = ieor(xoshiro_s(3), xoshiro_s(1))
        xoshiro_s(4) = ieor(xoshiro_s(4), xoshiro_s(2))
        xoshiro_s(2) = ieor(xoshiro_s(2), xoshiro_s(3))
        xoshiro_s(1) = ieor(xoshiro_s(1), xoshiro_s(4))

        xoshiro_s(3) = ieor(xoshiro_s(3), t)

        xoshiro_s(4) = rotl(xoshiro_s(4), 45)
        
    end function next


!+ This is the jump subroutine for the generator. It is equivalent
!   to 2^128 calls to next(); it can be used to generate 2^128
!   non-overlapping subsequences for parallel computations.

    subroutine jump()
        implicit none

        ! Local variables
        integer :: i, b ! Iterators
        integer(8), parameter, dimension(4) :: J = (/1733541517147835066_8, -3051731464161248980_8, &
                                                     -6244198995065845334_8, 4155657270789760540_8/)
        integer(8) :: v
        integer(8) :: s1, s2, s3, s4

        s1 = 0_8
        s2 = 0_8
        s3 = 0_8
        s4 = 0_8

        do i = 1, 4
            do b = 0, 63
                if ( btest(J(i), b) ) then
                    s1 = ieor(s1, xoshiro_s(1))
                    s2 = ieor(s2, xoshiro_s(2))
                    s3 = ieor(s3, xoshiro_s(3))
                    s4 = ieor(s4, xoshiro_s(4))
                end if
                v = next()
            end do
        end do
        xoshiro_s(1) = s1
        xoshiro_s(2) = s2
        xoshiro_s(3) = s3
        xoshiro_s(4) = s4
    end subroutine jump

!+ This is the long-jump function for the generator. It is equivalent to
!   2^192 calls to next(); it can be used to generate 2^64 starting points,
!   from each of which jump() will generate 2^64 non-overlapping
!   subsequences for parallel distributed computations.
    subroutine long_jump()
        implicit none

        ! Local variables
        integer :: i, b ! Iterators
        integer(8), parameter, dimension(4) :: LJ = (/8566230491382795199_8, -4251311993797857357_8, &
                                                     8606660816089834049_8, 4111957640723818037_8/)
        integer(8) :: v
        integer(8) :: s1, s2, s3, s4

        s1 = 0_8
        s2 = 0_8
        s3 = 0_8
        s4 = 0_8

        do i = 1, 4
            do b = 0, 63
                if ( btest(LJ(i), b) ) then
                    s1 = ieor(s1, xoshiro_s(1))
                    s2 = ieor(s2, xoshiro_s(2))
                    s3 = ieor(s3, xoshiro_s(3))
                    s4 = ieor(s4, xoshiro_s(4))
                end if
                v = next()
            end do
        end do
        xoshiro_s(1) = s1
        xoshiro_s(2) = s2
        xoshiro_s(3) = s3
        xoshiro_s(4) = s4
    end subroutine long_jump

end module






















