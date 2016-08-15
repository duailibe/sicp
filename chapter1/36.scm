(define tolerance 0.00001)

(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))

(define (fixed-point f first-guess)
  (define (try guess)
    (newline)
    (display guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (f x) (/ (log 1000) (log x)))

(fixed-point f 10.0)

(define (average x1 x2) (/ (+ x1 x2) 2))

(fixed-point (lambda (x) (average x (f x))) 10.0)
