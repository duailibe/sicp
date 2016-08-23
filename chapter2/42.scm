(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (enumerate-interval low high)
  (if (> low high)
    ()
    (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (fold-right append () (map proc seq)))

; Solution

; We define a board as a list where each element is the pair (row column) for each queen of the
; board. For example, for a 4x4 board:
;
;   ((3, 4), (1, 3), (4, 2), (2, 1))
;
;   |---|---|---|---|
;   |   |   | Q |   |
;   |---|---|---|---|
;   | Q |   |   |   |
;   |---|---|---|---|
;   |   |   |   | Q |
;   |---|---|---|---|
;   |   | Q |   |   |
;   |---|---|---|---|
;
; So an empty board is simply the empty list

(define empty-board ())

(define (make-position row col)
  (cons row col))

(define (position-row position)
  (car position))

(define (position-col position)
  (cdr position))

(define (pair-safe? queen1 queen2)
  (let ((row1 (position-row queen1))
        (col1 (position-col queen1))
        (row2 (position-row queen2))
        (col2 (position-col queen2)))
    (not
      (or
        (= row1 row2)
        (= col1 col2)
        (= (abs (- row1 row2)) (abs (- col1 col2)))))))

(define (safe? new-col queens)
  ; We only check the new queen (last added), so the first element
  (let ((new-queen (car queens))
        (rest-of-queens (cdr queens)))

    (define (iter-safe? rest-of-queens)
      (or (null? rest-of-queens)
          (and (pair-safe? new-queen (car rest-of-queens)) (iter-safe? (cdr rest-of-queens)))))

    (iter-safe? rest-of-queens)))

(define (adjoin-position new-row col rest-of-queens)
  (cons (make-position new-row col) rest-of-queens))

(queens 4)
; Value: (((3 . 4) (1 . 3) (4 . 2) (2 . 1)) ((2 . 4) (4 . 3) (1 . 2) (3 . 1)))

(length (queens 5))
; Value: 10

(length (queens 6))
; Value: 4

(length (queens 7))
; Value: 40

(length (queens 8))
; Value: 92

(length (queens 9))
; Value: 352

(length (queens 10))
; Value: 724
