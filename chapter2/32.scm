(define (subsets s)
  (if (null? s)
      (list s)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(subsets (list 1 2 3))
; Value: (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))

; The result of `subsets` is all the combinations of the that contains `1` and all the combinations
; of the set that does not include `1`. So this algorithm works by computing, for a given list
; `(1 2 3)` all the subsets of `(2 3)` and then joining it with the result of including `1` to each
; item of the `(2 3)` subsets.
