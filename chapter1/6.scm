(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(sqrt-iter 1.0 9)
; Infinte loop!

; The problem here is that since the interpretor uses the applicative order when evaluating, calling
; sqrt-iter evalutes to:
;
; (new-if (good-enough? 1.0 9) 1.0 (sqrt-iter (improve 1.0 9) 9))
; (new-if false 1.0 (sqrt-iter 5 9))
;
; and it will call sqrt-iter again, i.e., `else-clause` will be evaluated even though it wouldn't
; be necessary since `predicate` evaluates to false. That causes an infinite loop.
