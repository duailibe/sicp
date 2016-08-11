(define (next n)
  (if (= n 2) 3 (+ n 2)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(timed-prime-test 10000000019)
; 10000000019 *** .07999999999999999

(timed-prime-test 10000000033)
; 10000000033 *** .08000000000000002

(timed-prime-test 10000000061)
; 10000000061 *** .08000000000000002

; About 66% of the time

(timed-prime-test 100000000003)
; 100000000003 *** .24999999999999994

(timed-prime-test 100000000019)
; 100000000019 *** .24

(timed-prime-test 100000000057)
; 100000000057 *** .2500000000000001

; About 63% of the time
