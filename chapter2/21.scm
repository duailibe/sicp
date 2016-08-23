(define (square-list items)
  (if (null? items)
      items
      (cons (square (car items)) (square-list (cdr items)))))

(square-list (list 1 2 4 5))
; Value: (1 4 16 25)

(define (square-list items)
  (map square items))

(square-list (list 1 2 4 5))
; Value: (1 4 16 25)
