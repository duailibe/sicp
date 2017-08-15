(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

; linear time
(define (tree->list tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))


(define (union-set s1 s2)
  (define (merge list1 list2)
    (cond ((null? list1) list2)
          ((null? list2) list1)
          (else
            (let ((x1 (car list1)) (x2 (car list2)))
              (cond ((= x1 x2) (cons x1 (merge (cdr list1) (cdr list2))))
                    ((< x1 x2) (cons x1 (merge (cdr list1) list2)))
                    ((> x1 x2) (cons x2 (merge list1 (cdr list2)))))))))

  (list->tree (merge (tree->list s1) (tree->list s2))))


(define (intersection-set s1 s2)
  (define (merge list1 list2)
    (if (or (null? list1) (null? list2))
        '()
        (let ((x1 (car list1)) (x2 (car list2)))
          (cond ((= x1 x2) (cons x1 (merge (cdr list1) (cdr list2))))
                ((< x1 x2) (merge (cdr list1) list2))
                ((> x1 x2) (merge list1 (cdr list2)))))))

  (list->tree (merge (tree->list s1) (tree->list s2))))

(define s1 (list->tree '(1 2 3 5)))
(define s2 (list->tree '(2 4 5 6)))

(tree->list (union-set s1 s2))
; Value: (1 2 3 4 5 6)

(tree->list (intersection-set s1 s2))
; Value: (2 5)
