(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        (else
         (error "unknown expression type -- DERIV" exp))))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
 (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp num)
 (and (number? exp) (= exp num)))

(define (make-sum a1 a2)
 (cond ((=number? a1 0) a2)
       ((=number? a2 0) a1)
       ((and (number? a1) (number? a2)) (+ a1 a2))
       (else (list a1 '+ a2))))

(define (sum? x)
 (and (pair? x) (eq? (cadr x) '+)))

(define (addend s) (car s))

(define (augend s) (caddr s))

(define (make-product m1 m2)
 (cond ((or (=number? m1 0) (=number? m2 0)) 0)
       ((=number? m1 1) m2)
       ((=number? m2 1) m1)
       ((and (number? m1) (number? m2)) (* m1 m2))
       (else (list m1 '* m2))))

(define (product? x)
 (and (pair? x) (eq? (cadr x) '*)))

(define (multiplier p) (car p))

(define (multiplicand p) (caddr p))

; testing

(deriv '(x + (3 * (x + (y + 2)))) 'x)
; Value: 4

; b) solution

(define (augend s)
  (let ((aug (cddr s)))
    (if (null? (cdr aug))
        (car aug)
        aug)))

(define (multiplicand p)
  (let ((mult (cddr p)))
    (if (null? (cdr mult))
        (car mult)
        mult)))

(deriv '(x + 3 * (x + y + 2)) 'x)
; Value: 4

; This is not the right solution though, given the following expression:
;
; '(x * x + x)
;
; and its derivation is `2x + 1`. But this implementation will incorrectly evaluate it as
;
; (x * (x + x))
;
; and its derivation is `4x`

(deriv '(x * x + x) 'x)
; Value: ((x * 2) + (x + x))
