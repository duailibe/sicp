; given code

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
 (let ((p1 (* (lower-bound x) (lower-bound y)))
       (p2 (* (lower-bound x) (upper-bound y)))
       (p3 (* (upper-bound x) (lower-bound y)))
       (p4 (* (upper-bound x) (upper-bound y))))
   (make-interval (min p1 p2 p3 p4)
                  (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

; 2.7 solution

(define (make-interval a b) (cons a b))

(define (lower-bound interval) (car interval))

(define (upper-bound interval) (cdr interval))

(define a (make-interval 1 5))
(define b (make-interval 6 9))

(add-interval a b)
; Value: (7 . 14)

(mul-interval a b)
; Value: (6 . 45)

(div-interval a b)
; Value: (.1111111111111111 . .8333333333333333)

; 2.8 solution

(define (sub-interval x y)
  (add-interval x
                (make-interval (- (upper-bound y))
                               (- (lower-bound y)))))

(sub-interval a b)
; Value: (-8 . -1)

; 2.9 solution

; width(x + y) = (upper(x + y) - lower(x + y)) / 2
;              = ((upper(x) + upper(y)) - (lower(x) + lower(y))) / 2
;              = (upper(x) - lower(x)) / 2 + (upper(y) - lower(y)) / 2
;              = width(x) + width(y)
;
; width(x - y) = (upper(x - y) - lower(x - y)) / 2
;              = ((upper(x) - lower(y)) - (lower(x) - upper(y))) / 2
;              = (upper(x) - lower(x)) / 2 + (upper(y) - lower(y)) / 2
;              = width(x) + width(y)
;
; A counter example for the multiplication:

(define c (make-interval 5 10))
(define d (make-interval 10 15))
(define e (make-interval 15 20))

(mul-interval c d)
; Value: (50 . 150) -> width = 50

(mul-interval c e)
; Value: (75 . 200) -> width = 62.5

(mul-interval d e)
; Value: (150 . 300) -> width = 75

; All the intervals have the same width, but multiplying different intervals yields intervals
; with different widths, which means the width of the multiplication cannot be a function of
; only the width of the arguments.

; 2.10 solution

(define (div-interval x y)
  (if (and (<= (lower-bound y) 0) (>= (lower-bound x) 0))
      (error "Interval spans zero")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

(div-interval a (make-interval -1 1))
; yields an error

(div-interval a b)
; Value: (.1111111111111111 . .8333333333333333)

; 2.11 solution

; 9 cases:
;    (-, -) * (-, -)
;    (-, -) * (-, +)
;    (-, -) * (+, +)
;    (-, +) * (-, -)
;    (-, +) * (-, +)
;    (-, +) * (+, +)
;    (+, +) * (-, -)
;    (+, +) * (-, +)
;    (+, +) * (+, +)

; Implementing mul-interval considering the 9 cases in the order above

(define (mul-interval x y)
  (let ((x1 (lower-bound x))
        (x2 (upper-bound x))
        (y1 (lower-bound y))
        (y2 (upper-bound y)))
    (cond
      ; (-, -) * (-, -)
      ((and (<= x1 0)
            (<= x2 0)
            (<= y1 0)
            (<= y2 0))
       (make-interval (* x2 y2) (* x1 y1)))
      ; (-, -) * (-, +)
      ((and (<= x1 0)
            (<= x2 0)
            (<= y1 0)
            (>= y2 0)
        (make-interval (* x1 y2) (* x1 y1))))
      ; (-, -) * (+, +)
      ((and (<= x1 0)
            (<= x2 0)
            (>= y1 0)
            (>= y2 0)
        (make-interval (* x1 y2) (* x2 y1))))
      ; (-, +) * (-, -)
      ((and (<= x1 0)
            (>= x2 0)
            (<= y1 0)
            (<= y2 0)
        (make-interval (* x2 y1) (* x1 y1))))
      ; (-, +) * (-, +)
      ((and (<= x1 0)
            (>= x2 0)
            (<= y1 0)
            (>= y2 0)
        (make-interval (min (* x1 y2) (* x2 y1))
                       (max (* x1 y1) (* x2 y2)))))
      ; (-, +) * (+, +)
      ((and (<= x1 0)
            (>= x2 0)
            (>= y1 0)
            (>= y2 0)
        (make-interval (* x1 y2) (* x2 y2))))
      ; (+, +) * (-, -)
      ((and (>= x1 0)
            (>= x2 0)
            (<= y1 0)
            (<= y2 0)
        (make-interval (* x2 y1) (* x1 y2))))
      ; (+, +) * (-, +)
      ((and (>= x1 0)
            (>= x2 0)
            (<= y1 0)
            (>= y2 0)
        (make-interval (* x2 y1) (* x2 y2))))
      ; (+, +) * (+, +)
      ((and (>= x1 0)
            (>= x2 0)
            (>= y1 0)
            (>= y2 0))
       (make-interval (* x1 y1) (* x2 y2))))))

(define a (make-interval 1 5))
(define b (make-interval -2 4))
(define c (make-interval -6 -3))

(mul-interval a a)
; Value: (1 . 25)
(mul-interval a b)
; Value: (-10 . 20)
(mul-interval b a)
; Value: (-10 . 20)
(mul-interval b b)
; Value: (-8 . 16)
(mul-interval b c)
; Value: (-24 . 12)
(mul-interval c b)
; Value: (-24 . 12)
(mul-interval c c)
; Value: (9 . 36)
(mul-interval a c)
; Value: (-30 . -3)
(mul-interval c a)
; Value: (-30 . -3)
