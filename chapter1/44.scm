(define dx 0.00001)

(define (smooth f)
  (lambda (x) (/ (+ (f x)
                    (f (+ x dx))
                    (f (- x dx)))
                 3)))

(define (square x) (* x x))

((smooth square) 3.0)
; Value: 9.000000000066665

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (smooth-n-folded f n)
  ((repeated smooth n) f))

((smooth-n-folded square 1) 3.0)
; Value: 9.000000000066665

((smooth-n-folded square 10) 3.0)
; Value: 9.000000000666667
