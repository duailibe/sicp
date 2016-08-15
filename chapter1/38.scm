(define (cont-frac-iter n d k)
  (define (step acc counter)
    (if (= counter 0)
        acc
        (step (/ (n counter)
                 (+ (d counter) acc))
              (- counter 1))))

  (step 0 k))

(define (e-cf k)
  (define (d i)
    (if (= (remainder i 3) 2)
      (/ (* 2 (+ i 1)) 3)
      1))

  (+ 2 (cont-frac-iter (lambda (n) 1.0) d k)))

(e-cf 10)
; Value: 2.7182817182817183
