(define (square x) (* x x))

(define (cube x) (* x x x))

(define (improve guess x)
  (/ (+ (/ x (square x))
        (* 2 guess))
     3))

(define (good-enough? guess x)
  (< (abs (/ (- (cube guess) x) x)) 0.001))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x)
                      x)))

(cube-root-iter 1.0 27)
;Value: 3.0000005410641766

(cube-root-iter 1 1e60)
;Value: 1.0000297994407463e20

(cube-root-iter 1 1e-60)
;Value: 1.0000741387649005e-20
