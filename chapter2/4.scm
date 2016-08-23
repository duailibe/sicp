(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

; (car (cons x y))
; ((cons x y) (lambda (p q) p))
; ((lambda (m) (m x y)) (lambda (p q) p))
; ((lambda (p q) p) x y)
; ((lambda (x y)) x) -> x

(define (cdr z)
  (z (lambda (p q) q)))
