; Given procedures

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

; Response of exercise

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (in-branch? branch)
    (element-of-set? symbol (symbols branch)))

  (cond ((leaf? tree) '())
        ((in-branch? (left-branch tree))
          (cons 0 (encode-symbol symbol (left-branch tree))))
        ((in-branch? (right-branch tree))
          (cons 1 (encode-symbol symbol (right-branch tree))))
        (else (error "symbol non-existing" symbol))))


(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))

(encode '(a d a b b c a) sample-tree)
; Value: (0 1 1 0 0 1 0 1 0 1 1 1 0)
