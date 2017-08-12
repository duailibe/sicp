(define (adjoin-set x set)
  (if
    (null? set) (list x)
    (let ((y (car set)))
      (cond ((= x y) set)
            ((< x y) (cons x set))
            (else (cons y (adjoin-set x (cdr set))))))))

(adjoin-set 2 '(1 3))
; Value: (1 2 3)

(adjoin-set 2 '(1 2 3))
; Value: (1 2 3)

(adjoin-set 4 '(1 2 3))
; Value: (1 2 3 4)
