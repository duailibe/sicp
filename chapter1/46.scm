(define (iterative-improve good-enough? improve)
  (lambda (guess) (if (good-enough? guess)
                      guess
                      ((iterative-improve good-enough? improve) (improve guess)))))

(define (sqrt-iter x first-guess)
  (define (good-enough? guess)
    (< (abs (/ (- (square guess) x) x)) 0.001))

  (define (improve guess)
    (/ (+ guess (/ x guess)) 2))

  ((iterative-improve good-enough? improve) first-guess))

(sqrt-iter 81 1.0)
; Value: 9.000011298790216

(define (fixed-point f first-guess)
  (define (good-enough? guess)
    (< (abs (- (f guess) guess)) 0.0001))

  (define (improve guess)
    (f guess))

  ((iterative-improve good-enough? improve) first-guess))

(fixed-point cos 1.0)
; Value: .7391301765296711
