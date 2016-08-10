(define (even? n) (= (remainder n 2) 0))

(define (double n) (* n 2))

(define (halve n) (/ n 2))

(define (mul a b)
  (cond ((= b 0) 0)
        ((even? b) (double (mul a (halve b))))
        (else (+ a (mul a (- b 1))))))

(= (mul 3 0) 0)
(= (mul 2 3) 6)
(= (mul 4 8) 32)
