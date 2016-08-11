(define (filtered-accumulate-rec combiner null-value term a next b filter-predicate)
  (if (> a b)
      null-value
      (combiner (if (filter-predicate a) (term a) null-value)
                (filtered-accumulate-rec combiner
                                         null-value
                                         term
                                         (next a)
                                         next
                                         b
                                         filter-predicate))))

(define (filtered-accumulate-it combiner null-value term a next b filter-predicate)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (combiner result (if (filter-predicate a) (term a) null-value)))))

  (iter a null-value))

(define (inc a) (+ a 1))
(define (square a) (* a a))
(define (id a) a)

; assuming `prime?` is defined
(define (sum-prime-squares a b)
  (filtered-accumulate-it + 0 square a inc b prime?))

(define (product-coprimes n)
  (define (gcd a b)
    (if (= b 0)
      a
      (gcd b (remainder a b))))

  (define (coprime? a)
    (= (gcd a n) 1))

  (filtered-accumulate-it * 1 id 2 inc (- n 1) coprime?))

(product-coprimes 8)
; Value: 3 * 5 * 7 = 105
