(define (pascal line col)
  (cond ((or (= col 1) (= col line)) 1)
        (else (+ (pascal (- line 1) (- col 1))
                 (pascal (- line 1) col)))))

(= (pascal 1 1) 1)
(= (pascal 2 2) 1)
(= (pascal 3 1) 1)
(= (pascal 3 2) 2)
(= (pascal 3 3) 1)
(= (pascal 4 2) 3)
(= (pascal 4 3) 3)
(= (pascal 5 2) 4)
(= (pascal 5 3) 6)
(= (pascal 5 4) 4)