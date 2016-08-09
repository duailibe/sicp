(define (even? n) (= (remainder n 2) 0))

(define (double n) (* n 2))

(define (halve n) (/ n 2))

(define (mul a b)
  (define (mul-iter a b acc)
    (cond ((= b 0) acc)
          ((even? b) (mul-iter (double a) (halve b) acc))
          (else (mul-iter a (- b 1) (+ acc a)))))

  (mul-iter a b 0))

(= (mul 3 0) 0)
(= (mul 2 3) 6)
(= (mul 4 8) 32)
