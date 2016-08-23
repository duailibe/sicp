(define a (list 1 3 (list 5 7) 9))

; (cdr a) -> (3 (5 7) 9)
; (cdr (cdr a)) -> ((5 7) 9)
; (car (cdr (cdr a))) -> (5 7)
; (cdr (car (cdr (cdr a)))) -> (7)
; (car (cdr (car (cdr (cdr a))))) -> 7

(car (cdr (car (cdr (cdr a)))))
; Value: 7

(define b (list (list 7)))

; (car b) -> (7)
; (car (car b)) -> 7

(car (car b))
; Value: 7

(define c (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

; (cdr c) -> ((2 (3 (4 (5 (6 7))))))
; (car (cdr c)) -> (2 (3 (4 (5 (6 7)))))
; (cdr (car (cdr c))) -> ((3 (4 (5 (6 7)))))
; (car (cdr (car (cdr c)))) -> (3 (4 (5 (6 7))))
; (cdr (car (cdr (car (cdr c))))) -> ((4 (5 (6 7))))
; (car (cdr (car (cdr (car (cdr c)))))) -> (4 (5 (6 7)))
; (cdr (car (cdr (car (cdr (car (cdr c))))))) -> ((5 (6 7)))
; (car (cdr (car (cdr (car (cdr (car (cdr c)))))))) -> (5 (6 7))
; (cdr (car (cdr (car (cdr (car (cdr (car (cdr c))))))))) -> ((6 7))
; (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr c)))))))))) -> (6 7)
; (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr c))))))))))) -> (7)
; (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr c)))))))))))) -> 7

(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr c))))))))))))
; Value: 7
