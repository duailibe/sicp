(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (lookup given-key tree-of-records)
  (if (null? tree-of-records)
    false
    (let ((current (key (entry tree-of-records))))
      (cond ((equal? given-key current) (entry tree-of-records))
            ((< given-key current) (lookup given-key (left-branch tree-of-records)))
            ((> given-key current) (lookup given-key (right-branch tree-of-records)))))))

;
;        7
;      /   \
;     3     9
;   /   \     \
;  1     5     11
;

(define (key record)
  (car record))

(define tree
  (list (cons 7 "record7")
    (list (cons 3 "record3")
      (list (cons 1 "record1") '() '())
      (list (cons 5 "record5") '() '()))
    (list (cons 9 "record9")
      '()
      (list (cons 11 "record11") '() '()))))

(lookup 1 tree)
; Value (1 . "record1")

(lookup 3 tree)
; Value (3 . "record3")

(lookup 5 tree)
; Value (5 . "record5")

(lookup 7 tree)
; Value (7 . "record7")

(lookup 9 tree)
; Value (9 . "record9")

(lookup 11 tree)
; Value (11 . "record11")
