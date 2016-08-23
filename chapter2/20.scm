(define (same-parity a . z)
  (define (iter items res)
    (if (null? items)
        res
        (iter (cdr items)
              (if (= (remainder a 2) (remainder (car items) 2))
                  (append res (list (car items)))
                  res))))
  (iter z (list a)))

(same-parity 1 2 3 4 5 6 7)
; Value: (1 3 5 7)

(same-parity 2 3 4 5 6 7)
; Value: (2 4 6)
