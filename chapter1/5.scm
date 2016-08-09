(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

; Applicative-order evaluation
;
; The arguments are evaluated before application of the procedure. In that case, the interpreter
; will try to evaluate `(p)` before applying the `test` procedure, which will result in a infinite
; loop, since `(p)` evaluates to `(p)`.
;
;
; Normal-order evaluation
;
; The arguments are evaluated only after expanding the procedure. In that case, the expression
; will evaluate to:
;
; (if (= 0 0) 0 (p))
; Value: 0
