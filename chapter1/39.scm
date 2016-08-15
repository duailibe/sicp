(define (cont-frac-iter n d k)
  (define (step acc counter)
    (if (= counter 0)
        acc
        (step (/ (n counter)
                 (+ (d counter) acc))
              (- counter 1))))

  (step 0 k))

(define (tan-cf x k)
  (define (n i)
    (if (= i 1)
        x
        (- (* x x))))

  (define (d i)
    (- (* 2 i) 1))

  (cont-frac-iter n d k))

(tan-cf 3.1415 100)
; Value: -9.265359005829808e-5
; tan(pi) = 0

(tan-cf (/ 3.1415 4) 100)
; Value: .9999536742781562
; tan(pi/4) = 1
