(define (make-mobile left right)
  (list left right))

(define (left-branch mobile) (car mobile))

(define (right-branch mobile) (car (cdr mobile)))

(define (make-branch length structure)
  (list length structure))

(define (branch-length branch) (car branch))

(define (branch-structure branch) (car (cdr branch)))

(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (if (not (pair? structure))
        structure
        (total-weight structure))))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define b1 (make-branch 2 5))
(define b2 (make-branch 1 10))
(define m1 (make-mobile b1 b2))

(total-weight m1)
; Value: 15

(define b3 (make-branch 1 m1))
(define b4 (make-branch 2 15))
(define m2 (make-mobile b3 b4))

(total-weight m2)
; Value: 30

(define (branch-torque branch)
  (* (branch-length branch) (branch-weight branch)))

(define (branch-balanced? branch)
  (or (not (pair? (branch-structure branch)))
      (balanced? (branch-structure branch))))

(define (balanced? mobile)
  (and
    (= (branch-torque (left-branch mobile))
       (branch-torque (right-branch mobile)))
    (branch-balanced? (left-branch mobile))
    (branch-balanced? (right-branch mobile))))

(balanced? m1)
; Value: #t

(balanced? m2)
; Value: #f

(define b5 (make-branch 3 5))
(define m3 (make-mobile b3 b5))

(balanced? m3)
; Value: #t
