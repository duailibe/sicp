(define zero
  (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; `one` should be the result of `(add-1 zero)`
; (add-1 zero)
; (lambda (f) (lambda (x) (f ((zero f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) x) x))))
; (lambda (f) (lambda (x) (f x)))

(define one
  (lambda (f) (lambda (x) (f x))))

; `two` should be the result of `(add-1 one)`
; (add-1 one)
; (lambda (f) (lambda (x) (f ((one f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
; (lambda (f) (lambda (x) (f (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

; looks like any number `n` can be represented as
; `(lambda (f) (lambda (x) (f (f (f ... (f x))))))` (`f` applied n times)
; to define `+` operator

(define (+ a b)
  (lambda (f) (lambda (x) (((a f) x) ((b f) x)))))
