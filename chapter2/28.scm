(define (fringe tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (list tree))
        (else (append (fringe (car tree)) (fringe (cdr tree))))))

(define x (list (list 1 2) (list 3 4)))

(fringe x)
; Value: (1 2 3 4)

(fringe (list x x))
; Value: (1 2 3 4 1 2 3 4)
