(define (sum-squares a b)
  (+ (* a a)
     (* b b)))

(define (min-two a b) (if (< a b) a b))

(define (max-two a b) (if (< a b) b a))

(define (sum-squares-two-larger a b c)
  (sum-squares (max-two a b) (max-two c (min-two a b))))

; Test
(= (sum-squares-two-larger 1 5 9) 106)
