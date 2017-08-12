(define (union-set set1 set2)
  (if (null? set1)
    set2
    (let ((x1 (car set1)) (x2 (car set2)))
      (cond ((= x1 x2) (cons x1 (union-set (cdr set1) (cdr set2))))
            ((< x1 x2) (cons x1 (union-set (cdr set1) set2)))
            ((> x1 x2) (cons x2 (union-set set1 (cdr set2))))))))

(union-set '(1 2 3 5) '(2 4 5 6))
; Value: (1 2 3 4 5 6)
