(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpsons-rule f a b n)
  (define h (/ (- b a) n))
  (define (term k)
    (* (cond ((or (= k 0) (= k n)) 1)
             ((even? k) 2)
             (else 4))
       (f (+ a (* k h)))))
  (define (next k) (+ k 1))

  (/ (* h (sum term 0 next n)) 3))

(define (cube x) (* x x x))

(simpsons-rule cube 0 1 100)
; Value: 4

(simpsons-rule cube 0 1 1000)
; Value: 4
