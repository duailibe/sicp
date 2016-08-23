(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; 2.33 solution

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) () sequence))

(map square (list 1 2 3 4))
; Value: (1 4 9 16)

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(append (list 1 2 3) (list 4 5 6))
; Value: (1 2 3 4 5 6)

(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))

(length (list 1 2 3 4))
; Value: 4

; 2.34 solution

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) (+ (* higher-terms x) this-coeff))
              0
              coefficient-sequence))

(horner-eval 2 (list 1 3 0 5 0 1))
; Value: 79

; 2.35 solution

(define (count-leaves t)
  (accumulate + 0 (map (lambda (st) (if (pair? st) (count-leaves st) 1)) t)))

(define t (list (list 1 2 (list 3 4)) 5 (list 6 7)))

(count-leaves t)
; Value: 7

; 2.36 solution

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      ()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(accumulate-n + 0 (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
