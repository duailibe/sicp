(define (cont-frac n d k)
  (define (step counter)
    (if (> counter k)
        0
        (/ (n counter)
           (+ (d counter)
              (step (+ counter 1))))))
  (step 1))

(define (cont-frac-iter n d k)
  (define (step acc counter)
    (if (= counter 0)
        acc
        (step (/ (n counter)
                 (+ (d counter) acc))
              (- counter 1))))

  (step 0 k))

(/ 1.0 (cont-frac (lambda (n) 1.0) (lambda (n) 1.0) 10))
; Value: 1.6181818181818184

(/ 1.0 (cont-frac (lambda (n) 1.0) (lambda (n) 1.0) 11))
; Value: 1.6179775280898876

(/ 1.0 (cont-frac (lambda (n) 1.0) (lambda (n) 1.0) 12))
; Value: 1.6180555555555558

(= (cont-frac (lambda (n) 1.0) (lambda (n) 1.0) 10)
   (cont-frac-iter (lambda (n) 1.0) (lambda (n) 1.0) 10))
