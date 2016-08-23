(define (square-tree tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(define tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))

(square-tree tree)
; Value: (1 (4 (9 16) 25) (36 49))

(define (square-tree tree)
  (if (not (pair? tree))
      (square tree)
      (map square-tree tree)))

(square-tree tree)
; Value: (1 (4 (9 16) 25) (36 49))

; 2.31 solution

(define (map-tree proc tree)
  (if (not (pair? tree))
      (proc tree)
      (map proc tree)))

(square-tree tree)
; Value: (1 (4 (9 16) 25) (36 49))
