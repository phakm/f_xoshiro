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

    private rotl

    public

    contains
    
    integer function rotl(x, k)

        implicit none

      ! Function arguments
        integer, intent(in) :: x, k        
      
!-----------------------------------------------------------------------------
        rotl = ior(shiftl(x, k) , (shiftr(x, (64 - k))))
      
    end function rotl


end module