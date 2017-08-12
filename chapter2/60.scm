; same as list with no duplicates
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

; adjoin-set is simpler since we can just add the element to the set (duplicates are allowed)
(define (adjoin-set x set)
  (cons x set))

; same for union, just concat two lists
(define (union-set set1 set2)
  (append set1 set2))

; intersection stays the same
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))


; adjoin-set is now O(1) instead of O(n)
; union-set was reduced from O(n^2) to O(n)

; Applications that are time sensitive for adjoin or union, but don't have restrictions on space
; can use this implementation
