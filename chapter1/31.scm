(define (product-rec term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-rec term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))

  (iter a 1))

(define (id x) x)

(define (inc n) (+ n 1))

(define (factorial product n)
  (product id 1 inc n))

(= (factorial product-rec 4) 24)
(= (factorial product-iter 4) 24)

; Estimate pi

(define (nom-term n)
  (if (odd? n) (+ n 1) n))

(define (denom-term n)
  (if (even? n) (+ n 1) n))

(define (estimate-pi procedure n)
  (define (term k)
    (/ (nom-term k) (denom-term k)))

  (* 2.0 (procedure term 1 inc n)))

(estimate-pi product-rec 100)
; Value: 3.1260789002154112

(estimate-pi product-rec 1000)
; Value: 3.1400238186005973 (not good enough)

(estimate-pi product-rec 100000)
; Aborting!: maximum recursion depth exceeded

(estimate-pi product-iter 100000)
; Value: 3.1415769458228726 (this takes a while)
