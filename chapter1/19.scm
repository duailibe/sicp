; 1st transformation
; a = aq + ap + bq
; b = bp + aq

; 2nd transformation
; a = aq + ap + bq
;   = aq^2 + apq + bq^2 + apq + ap^2 + bpq + bpq + aq^2
;   = 2aq^2 + 2apq + bq^2 + ap^2 + 2bpq
;   = a(2q^2 + 2pq + p^2) + b(q^2 + 2pq)
;   = a(p^2 + q^2) + (a + b)(q^2 + 2pq)
; b = bp + aq
;   = bp^2 + apq + aq^2 + apq + bq^2
;   = b(p^2 + q^2) + a(q^2 + 2pq)
;
; p' = p^2 + q^2
; q' = q^2 + 2pq


(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))    ; compute p'
                   (+ (* q q) (* 2 p q))  ; compute q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(= (fib 0) 0)

(= (fib 1) 1)

(= (fib 5) 5)

(= (fib 6) 8)
