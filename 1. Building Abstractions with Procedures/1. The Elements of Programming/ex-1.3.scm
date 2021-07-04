#|Define a procedure that takes three numbers
as arguments and returns the sum of the squares of the two
larger numbers.|#

(define (sqare a)
  (* a a)
)

(define (sum-of-squares a b)
  (+ (sqare a) (sqare b))
)

; Simple implementation
(define (sum-of-bigger-squares a b c)
  (if (> a b)
    (if (> b c)
      (sum-of-squares a b)
      (sum-of-squares a c)
    )
    (if (> a c)
      (sum-of-squares b a)
      (sum-of-squares b c)
    )
  )
)

; Auxiliary quicksort procedure
(define (quicksort lst)
  (cond
    ((or (null? lst) (null? (cdr lst)))
      lst)
    (else
      (let ((pivot (car lst))
            (rest (cdr lst)))
        (append
          (quicksort
            (filter (lambda (x) (>= x pivot)) rest)
          )
          (list pivot)
          (quicksort
            (filter (lambda (x) (< x pivot)) rest)
          )
        )
      )
    )
  )
)

; Improved Implementation
(define (better-sum-bigger-squares lst)
  (let ((sorted (quicksort lst)))
    (sum-of-squares (car sorted) (cadr sorted))
  )
)

(display "Regular sum of biggest squares\n")
(display (sum-of-bigger-squares 2 1 3))

(display "\nBetter sum of biggest squares\n")
(display (better-sum-bigger-squares (list 4 6 7 2 9 7)))