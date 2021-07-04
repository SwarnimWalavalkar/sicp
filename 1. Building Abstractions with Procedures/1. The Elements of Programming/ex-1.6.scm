#|
Alyssa P. Hacker doesn’t see why if needs to be provided as a special form. 
“Why can’t I just define it as an ordinary procedure in terms of cond?” she asks. 
Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if.

Eva demonstrates the program for Alyssa; Delighted, Alyssa uses new-if to rewrite the square-root program.

What happens when Alyssa attempts to use this to compute square roots? Explain.
|#

(define (new-if predicate
                then-clause
                else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

#|
Since new-if is a procedure, and not a built-in operator; assuming the interpreter is using applicative-order evaluation, 
each parameters subexpressions will be evaluated before the procedure is applied. 
Hence, when evaluating new-if the predicate and the two alternatives will always be evaluated, whatever if (good-enough? guess x) is evaluated to. 
Since the second alternative is calling the function itself recursively, the function will be stuck in an infinite loop.
|#