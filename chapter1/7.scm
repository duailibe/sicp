(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

; To fix the algorithm, it just needs to check if the difference between the square of guess
; and the radicand is small enough compared to the value of the radicand (i.e. the relative
; difference instead of absolute)
(define (good-enough? guess x)
  (< (abs (/ (- (square guess) x) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(sqrt-iter 1 1e60)
;Value: 1.0000788456669446e30

(sqrt-iter 1 0.00000001)
;Value: 1.0000040611237676e-4
