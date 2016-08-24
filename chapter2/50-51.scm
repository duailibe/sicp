; 2.50 solution

(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 1 0)
                     (make-vect 0 0)
                     (make-vect 1 1)))

(define (flip-180 painter)
  (transform-painter painter
                     (make-vect 1 1)
                     (make-vect 0 1)
                     (make-vect 1 0)))

(define (flip-270 painter)
  (transform-painter painter
                     (make-vect 0 1)
                     (make-vect 0 0)
                     (make-vect 1 1)))

; 2.51 solution

(define (below painter1 painter2)
  (let ((paint-bottom
          (transform-painter painter1
                             (make-vect 0 0)
                             (make-vect 1 0)
                             (make-vect 0 0.5)))
        (paint-up
          (transform-painter painter2
                             (make-vect 0 0.5)
                             (make-vect 1 0.5)
                             (make-vect 0 1))))
    (lambda (frame)
      (paint-bottom frame)
      (paint-up frame))))

(define (flip-90 painter)
  (transform-painter painter
                     (make-vect 0 1)
                     (make-vect 0 0)
                     (make-vect 1 1)))

(define (below painter1 painter2)
  (flip-270
    (beside (flip-90 painter1)
            (flip-90 painter2))))
