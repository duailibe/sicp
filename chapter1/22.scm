(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

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


(define (search-for-primes a)
  (define (search-three a n-found)
    (timed-prime-test a)
    (if (< n-found 3)
       (if (prime? a)
           (search-three (+ a 2) (+ n-found 1))
           (search-three (+ a 2) n-found))))

  (search-three a 0))

(search-for-primes 10000000001)
; 10000000019 *** .12999999999999998
; 10000000033 *** .13
; 10000000061 *** .13

(search-for-primes 100000000001)
; 100000000003 *** .4099999999999999
; 100000000019 *** .40000000000000013
; 100000000057 *** .40000000000000036
