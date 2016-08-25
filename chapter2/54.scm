(define (equal? lst1 lst2)
  (cond ((and (null? lst1) (null? lst2)) #t)
        ((and (pair? lst1) (pair? lst2)
          (and (equal? (car lst1) (car lst2))
               (equal? (cdr lst1) (cdr lst2)))))
        (else (eq? lst1 lst2))))

(equal? '(a b c) '(a b c))
; Value: #t

(equal? '(a b c) '(a b))
; Value: #f

(equal? '(a b) '(a b c))
; Value: #f

(equal? '((a b) c) '((a b) c))
; Value: #t

(equal? '((a b) c) '(a b c))
; Value: #f

(equal? 'a 'a)
; Value: #t
