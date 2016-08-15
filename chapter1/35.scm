; f(x) = 1 + 1/x
;
; For f(x) = x => x = 1 + 1/x => x^2 - x - 1 = 0 (the golden ratio is a solution of this equation)

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
; Value: 1.6180327868852458
