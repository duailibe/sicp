(define (gcd a b)
  (if (= 0 b)
    a
    (gcd b (remainder a b))))

(define (sign x)
  (if (< x 0) -1 1))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (make-rat n d)
  (let ((g (abs (gcd n d))))
    (cons (/ n g (sign d)) (/ d g (sign d)))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat 2 10))
(print-rat (make-rat -2 10))
(print-rat (make-rat 2 -10))
(print-rat (make-rat -2 -10))
