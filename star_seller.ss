; This is the Star Seller exercise in algorithmics,
; written in Scheme Lisp.                   [27 lines of code]

; This particular implementation was designed and tested on GNU Guile,
; the extension platform for the GNU platform which allows users to embed
; Scheme into their apps.

(use-modules (ice-9 rdelim)) ; Necessary for read-line
(define (askName)
    (define name "")
    (display "What is your name? ")
    (set! name (read-line))
    (if (string=? name "")
        (askName)
        name
    )
)
(define (askStars) 
    (define num -1)
    (display "How many stars do you want? ")
    (set! num 
      (cond ((string->number (read-line)))
        (else -1)
      ))
    (if (and (>= num 0) (<= num 200))
        num
        (askStars)
    )
)
(define name (askName))
(display (string-append "Hello, " name "!\n"))
(display (string-append (make-string (askStars) #\*) "\n"))
(display (string-append "Goodbye, " name))
(newline)

; This language is case-insensitive.
