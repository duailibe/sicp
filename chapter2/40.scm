(define (unique-pairs n)
  (flatmap (lambda (i))
    (map (lambda (j) (list i j)) (enumerate-interval (+ i 1) n))
    (enumerate-interval 1 n)))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))
