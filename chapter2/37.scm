(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      ()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))


(define matrix (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))

(define (matrix-*-vector m v)
  (map (lambda (mi) (dot-product mi v)) m))

(matrix-*-vector matrix (list 1 2 3))
; Value: (14 32 50)

(define (transpose mat)
  (accumulate-n cons () mat))

(transpose matrix)
; Value: ((1 4 7) (2 5 8) (3 6 9))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (mi) (matrix-*-vector cols mi)) m)))

(matrix-*-matrix matrix matrix)
; Value: ((30 36 42) (66 81 96) (102 126 150))
