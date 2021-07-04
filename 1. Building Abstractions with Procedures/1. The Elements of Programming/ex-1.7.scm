#|
Te good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. 
Also, in real computers, arithmetic operations are almost always performed with limited precision. 
This makes our test inadequate for very large numbers. 

Explain these statements, with examples showing how the test fails for small and large numbers.

An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next 
and to stop when the change is a very small fraction of the guess.

Design a square-root procedure that uses this kind of end
test. Does this work better for small and large numbers?
|#

(define (square x) (* x x))

(define (inaccurate-good-enough? guess x)
 (< (abs (- (square guess) x)) 0.001))

 #|
 For small numbers, good-enough? will always return true because the difference between x and guess (even if they differ by orders of magnitude) 
 will always be smaller than the tolerance value 0.001 used in the test.

For large number, good-enough? will never return true 
because the representation of floating point numbers is not accurate enough for their difference to ever fall below the tolerance value of 0.001.
 |#

;redefine the good-enough? procedure to stop if the difference between guesses is too small
(define (good-enough? previous-guess guess)
  (< (abs (/ (- guess previous-guess) guess)) 0.00000001)
)

;Implement the square root procedure to use the new good-enough? check
(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(display "square root 7589654826\n")
(display (sqrt 7589654826)) ;works well with large numbers

(display "\n\nsquare root 0.000000055698\n")
(display (sqrt 0.000000055698)) ;works well with small numbers

(display "\n\nsquare root 16\n")
(display (sqrt 16)) ;Also 16