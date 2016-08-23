(define (last-pair items)
  (if (null? (cdr items))
      (list (car items))
      (last-pair (cdr items))))

(last-pair (list 23 72 149 34))
; Value: 34

(define (reverse items)
  (if (null? items)
      items
      (append (reverse (cdr items)) (list (car items)))))

(reverse (list 1 4 9 16 25))
; Value: (25 16 9 4 1)
