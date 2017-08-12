(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (union-set set1 set2)
  (if (null? set1)
      set2
      (if (element-of-set? (car set1) set2)
        (union-set (cdr set1) set2)
        (cons (car set1) (union-set (cdr set1) set2)))))


(union-set (list 1 '(2 3) 4) (list 3 '(2 3) '(5) 6))
; Value: (1 4 3 (2 3) (5) 6)
