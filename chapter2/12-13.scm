; given code

(define (make-interval a b) (cons a b))

(define (lower-bound interval) (car interval))

(define (upper-bound interval) (cdr interval))

; 2.12 solution

(define (make-center-percent c p)
  (let ((w (* c (/ p 100.0))))
    (make-interval (- c w) (+ c w))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (percent i)
  (* (/ (width i) (center i)) 100))

(define a (make-center-percent 5 10))

a
; (4.5 . 5.5)

(center a)
; Value: 5

(percent a)
; Value: 10

; 2.13 solution

; Assuming positive centers, the multiplication follows:
;
; lower(x * y) = (cx - px * cx) * (cy - py * cy)
;              = cx * cy - px * cx * cy - py * cx * cy + px * py * cx * cy    (px * py ~ 0)
;              = cx * cy - cx * cy (px + py)
; which means cx * cy is the new center and the percent is px + py

(define (mul-interval x y)
 (let ((p1 (* (lower-bound x) (lower-bound y)))
       (p2 (* (lower-bound x) (upper-bound y)))
       (p3 (* (upper-bound x) (lower-bound y)))
       (p4 (* (upper-bound x) (upper-bound y))))
   (make-interval (min p1 p2 p3 p4)
                  (max p1 p2 p3 p4))))

(define a (make-center-percent 3 0.1))
(define b (make-center-percent 8 0.2))
(define c (mul-interval a b))

(center c)
; Value: 24.000048

(percent c)
; Value: .29999940000120395
