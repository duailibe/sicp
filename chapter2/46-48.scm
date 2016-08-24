; 2.46 solution

(define (make-vect x y) (cons x y))

(define (xcor-vect vect) (car vect))

(define (ycor-vect vect) (cdr vect))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
             (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2))
             (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect v scale)
  (make-vect (* (xcor-vect v) scale)
             (* (ycor-vect v) scale)))

; 2.47 solution

; first implementation:

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame) (car frame))

(define (edge1-frame frame) (car (cdr frame)))

(define (edge2-frame frame) (car (cdr (cdr frame))))

; second implementation:

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame frame) (car frame))

(define (edge1-frame frame) (car (cdr frame)))

(define (edge2-frame frame) (cdr (cdr frame)))

; 2.48 solution

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))
