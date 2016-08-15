(define (inc x) (+ x 1))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(= ((repeated inc 8) 1) 9)

(= ((repeated square 2) 5) 625)
