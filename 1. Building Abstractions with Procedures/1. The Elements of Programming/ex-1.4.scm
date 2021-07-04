(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 6 -12)
; 18

(a-plus-abs-b -6 12)
; 6

(a-plus-abs-b -12 -6)
; -6