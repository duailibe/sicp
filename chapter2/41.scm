(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append () (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      ()
      (cons low (enumerate-interval (+ low 1) high))))

(define (unique-triples n)
  (flatmap
    (lambda (i)
      (flatmap
        (lambda (j)
          (map (lambda (k) (list i j k))
               (enumerate-interval (+ j 1) n)))
        (enumerate-interval (+ i 1) n)))
    (enumerate-interval 1 n)))

(define (triple-sum? triple s)
  (= (fold-right + 0 triple) s))

(define (enumerate-triples n s)
  (filter (lambda (tri) (triple-sum? tri s))
          (unique-triples n)))

(enumerate-triples 10 8)
; Value: ((1 2 5) (1 3 4))
