(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (define (expt-iter b n acc)
    (cond ((= n 0) acc)
          ((even? n) (expt-iter (* b b) (/ n 2) acc))
          (else (expt-iter b (- n 1) (* acc b)))))

  (expt-iter b n 1))

(= (fast-expt 3 0) 1)
(= (fast-expt 4 4) 256)
(= (fast-expt 8 5) 32768)
