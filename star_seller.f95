! The Star Seller exercise in algorithmics,
! written in FORTRAN 95.                    [21 lines of code]

! Apparently, FORTRAN is not really free-form. The indentation you see
! below is what was defined by Vim's F95 syntax definition. Most other text
! editors exhibit the same behavior with regards to FORTRAN code.

      PROGRAM STAR_SELLER
          IMPLICIT NONE

          INTEGER       :: s, c
          CHARACTER(20) :: YOURNAME = ' '

          DO
            WRITE (*, *)     'What is your name? '
            READ  (*, '(A)') YOURNAME
            IF (.NOT. YOURNAME == ' ') EXIT
          ENDDO

          WRITE (*, *)     'Hello, ', YOURNAME, '!'
          DO
            WRITE (*, *)     'How many stars do you want? '
            READ  (*, *)      s
            IF (s >= 0 .AND. s <= 200) EXIT
          ENDDO

          DO c = 0, s
            WRITE (*, '(A)', advance="no")     '*'
          ENDDO
          WRITE (*, *) 

          WRITE (*, *) 'Goodbye, ', YOURNAME

      END PROGRAM STAR_SELLER

! This language is case-insensitive and indentation-sensitive.
