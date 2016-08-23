(define (reverse items)
  (if (null? items)
      items
      (append (reverse (cdr items)) (list (car items)))))

(define (deep-reverse items)
  (cond ((null? items) items)
        ((not (pair? items)) items)
        (else (append (deep-reverse (cdr items)) (list (deep-reverse (car items)))))))

(define x (list (list 1 2) (list 3 4)))

(deep-reverse x)
; Value: ((4 3) (2 1))

(define (deep-reverse items)
  (if (not (pair? items))
      items
      (reverse (map deep-reverse items))))

(deep-reverse x)
; Value: ((4 3) (2 1))
