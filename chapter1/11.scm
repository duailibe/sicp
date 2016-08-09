(define (f-next fn-1 fn-2 fn-3)
  (+ fn-1 (* 2 fn-2) (* 3 fn-3)))

; recursive process
(define (f1 n)
  (if (< n 3)
      n
      (f-next (f1 (- n 1))
              (f1 (- n 2))
              (f1 (- n 3)))))

(= (f1 0) 0)
(= (f1 1) 1)
(= (f1 2) 2)
(= (f1 3) 4)
(= (f1 4) 11)

; iterative process
; f(0) = 0
; f(1) = 1
; f(2) = 2
; f(3) = f(2) + 2*f(1) + 3*f(0)

(define (f2 n)
  (define (f-iter fn-1 fn-2 fn-3 count)
    (if (= count 0)
        (f-next fn-1 fn-2 fn-3)
        (f-iter (f-next fn-1 fn-2 fn-3) fn-1 fn-2 (- count 1))))

  (if (< n 3)
      n
      (f-iter 2 1 0 (- n 3))))

(= (f1 0) (f2 0))
(= (f1 1) (f2 1))
(= (f1 2) (f2 2))
(= (f1 3) (f2 3))
(= (f1 4) (f2 4))
(= (f1 5) (f2 5))
