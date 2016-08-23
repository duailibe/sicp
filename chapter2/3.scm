(define (make-segment start end) (cons start end))

(define (start-segment segment) (car segment))

(define (end-segment segment) (cdr segment))

(define (make-point x y) (cons x y))

(define (x-point point) (car point))

(define (y-point point) (cdr point))

(define (segment-length segment)
  (sqrt
    (+
      (square (- (x-point (start-segment segment)) (x-point (end-segment segment))))
      (square (- (y-point (start-segment segment)) (y-point (end-segment segment)))))))

; perimeter of a rectangle = 2 * width + 2 * height
(define (rect-perimeter rect)
  (+ (* 2 (rect-width rect))
     (* 2 (rect-height rect))))

; area of a rectangle = width * height
(define (rect-area rect)
  (* (rect-width rect)
     (rect-height rect)))

; first representation: store 2 perpendicular segments
;
; *AAAAAAAAAAAAAAAAAAAAAAAAAAA (* belongs to both A and B segments)
; B                          |
; B                          |
; B---------------------------

(define (make-rect a b) (cons a b))

(define (rect-width rect)
  (segment-length (car rect)))

(define (rect-height rect)
  (segment-length (cdr rect)))

(define rect1
  (make-rect
    (make-segment (make-point 0 10) (make-point 5 10))
    (make-segment (make-point 0 2) (make-point 0 10))))

(rect-perimeter rect1)
; Value: 26

(rect-area rect1)
; Value: 40

; other (simpler) representation: store 2 opposites corner in a rectangle
;
; A---------------------------
; |                          |
; |                          |
; ---------------------------B

(define (rect-width rect)
  (abs (- (x-point (car rect)) (x-point (cdr rect)))))

(define (rect-height rect)
  (abs (- (y-point (car rect)) (y-point (cdr rect)))))

(define rect2
  (make-rect (make-point 0 10)
             (make-point 5 2)))

(= (rect-perimeter rect2) 26)

(= (rect-area rect2) 40)
