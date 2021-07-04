#|
Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. 
He defines the following two procedures and then evaluates the expression. 

What behavior will Ben observe with an interpreter that uses applicative-order evaluation? 
What behavior will he observe with an interpreter that uses normal-order evaluation? Explain your answer. 

(Assume that the evaluation rule for the special form if is the same whether the interpreter is using normal or applicative order: The predicate expression is evaluated first, 
and the result determines whether to evaluate the consequent or the alternative expression.)
|#

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

#|
---Applicative evaluation - Infinite Loop:---
applicative-order evaluation replaces each formal parameter with the corrosponding argument in the body of the procedure.
Since procedure p doesnt have any formal parameters, its body will be evaluated which in turn starts the evaluation all over again, thus making an infinite loop.

---Normal evaluation - 0:---
normal-order evaluation would first substitute operand expressions for parameters until it obtained an expression involving only primitive operators.
Hence, in said procedure; since the predicate (= 0 0) evaluates to #t in the if, then (p) will not be evaluated and the result will be 0

|#