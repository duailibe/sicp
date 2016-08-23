(define (make-segment start end) (cons start end))

(define (start-segment segment) (car segment))

(define (end-segment segment) (cdr segment))

(define (make-point x y) (cons x y))

(define (x-point point) (car point))

(define (y-point point) (cdr point))

(define (average x y)
  (/ (+ x y) 2))

(define (midpoint-segment line-segment)
  (make-point
    (average (x-point (start-segment line-segment))
             (x-point (end-segment line-segment)))
    (average (y-point (start-segment line-segment))
             (y-point (end-segment line-segment)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(print-point
  (midpoint-segment
    (make-segment (make-point 0 0)
                  (make-point 8 9))))
