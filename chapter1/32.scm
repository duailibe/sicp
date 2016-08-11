(define (accumulate-rec combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-rec combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a acc)
    (if (> a b)
        acc
        (iter (next a) (combiner acc (term a)))))

  (iter a null-value))

(define (id x) x)

(define (inc n) (+ n 1))

(define (factorial-rec n)
  (accumulate-rec * 1 id 1 inc n))

(define (factorial-iter n)
  (accumulate-iter * 1 id 1 inc n))

(= (factorial-rec 4) 24)
(= (factorial-iter 4) 24)
