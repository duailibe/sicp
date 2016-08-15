(define (f g)
  (g 2))

; (f f)
; (f 2)
; (2 2)
; since 2 is not a procedure, the interpreter will emit an error.
