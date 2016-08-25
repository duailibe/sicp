(list 'a 'b 'c)
; Value: (a b c)

(list (list 'george))
; Value: ((george))

(cdr '((x1 x2) (y1 y2)))
; Value: ((y1 y2))

(cadr '((x1 x2) (y1 y2)))
; Value: (y1 y2)

(pair? (car '(a short list)))
; Value: #f

(memq 'red '((red shoes) (blue socks)))
; Value: #f

(memq 'red '(red shoes blue socks))
; Value: (red shoes blue socks)
