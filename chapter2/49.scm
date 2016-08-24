; 2.49 a) solution

(define outline-painter
  (segments->painter
     (list
       (make-segment (make-vect 0 0) (make-vect 0 1))
       (make-segment (make-vect 0 0) (make-vect 1 0))
       (make-segment (make-vect 1 1) (make-vect 0 1))
       (make-segment (make-vect 1 1) (make-vect 1 0)))))

; 2.49 b) solution

(define x-painter
  (segments->painter
     (list
       (make-segment (make-vect 0 0) (make-vect 1 1))
       (make-segment (make-vect 1 0) (make-vect 0 1)))))

; 2.49 c) solution

(define diamond-painter
  (segments->painter
     (list
       (make-segment (make-vect 0.5 0) (make-vect 0 0.5))
       (make-segment (make-vect 0.5 0) (make-vect 1 0.5))
       (make-segment (make-vect 0.5 1) (make-vect 0 0.5))
       (make-segment (make-vect 0.5 1) (make-vect 1 0.5)))))
