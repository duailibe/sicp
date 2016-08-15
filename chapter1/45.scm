(define tolerance 0.00001)

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (damp-n-folded f n)
  ((repeated average-damp n) f))

(define (nth-root n)
  (lambda (x) (/ 1 (expt x (- n 1)))))

;(fixed-point (nth-root 2) 0.5) => does not converge
(fixed-point (damp-n-folded (nth-root 2) 1) 0.5)
(fixed-point (damp-n-folded (nth-root 3) 1) 0.5)
;(fixed-point (damp-n-folded (nth-root 4) 1) 0.5) => does not converge
(fixed-point (damp-n-folded (nth-root 4) 2) 0.5)
(fixed-point (damp-n-folded (nth-root 5) 2) 0.5)
(fixed-point (damp-n-folded (nth-root 6) 2) 0.5)
(fixed-point (damp-n-folded (nth-root 7) 2) 0.5)
;(fixed-point (damp-n-folded (nth-root 8) 2) 0.5) => does not converge
(fixed-point (damp-n-folded (nth-root 8) 3) 0.5)
(fixed-point (damp-n-folded (nth-root 9) 3) 0.5)
(fixed-point (damp-n-folded (nth-root 10) 3) 0.5)
(fixed-point (damp-n-folded (nth-root 11) 3) 0.5)
(fixed-point (damp-n-folded (nth-root 12) 3) 0.5)
(fixed-point (damp-n-folded (nth-root 13) 3) 0.5)
(fixed-point (damp-n-folded (nth-root 14) 3) 0.5)
(fixed-point (damp-n-folded (nth-root 15) 3) 0.5)
;(fixed-point (damp-n-folded (nth-root 16) 3) 0.5) => does not converge

; Seems like with n average damps it's possible to find at most the roots for orders < 2^(n + 1).
