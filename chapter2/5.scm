(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

; `find-expt` receives n > 0 and base > 0 and returns `k` that `(base ^ k) * x = n`, for `x > 0`
; and `x` not divisible by `base`
(define (find-expt n base)
  (define (inner n a)
    (if (= (remainder n base) 0)
      (inner (/ n base) (+ a 1))
      a))
  (inner n 0))

(define (car x)
  (find-expt x 2))

(define (cdr x)
  (find-expt x 3))

(= (car (cons 4 5)) 4)

(= (cdr (cons 4 5)) 5)
