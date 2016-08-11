(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))

  (iter a 0))

(define (id x) x)

(define (next x) (+ x 1))

(= (sum id 0 next 10) 55)
