;1.1
10
(+ 5 4 3)
(- 9 1)
(/ 6 2)
(+ (* 2 4) (- 4 6))
(define a 3)
(define b (+ a 1))
(+ a b (* a b))
(= a b)
(if (and (> b a) (< b (* b a)))
    b
    a)

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))

(+ 2 (if (> b a) b a))

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))

;1.2
(/ (+ 5
      4
      (- 2
         (- 3 
            (+ 6 (/ 4 5)))))
   (* 3
      (- 6 2)
      (- 2 7)))

;Exercise 1.3: Define a procedure that takes three numbers 
;as arguments and returns the sum of the squares of the two larger numbers.
;x,y  - x >= z && y >= z 
;x,z  - x >= y && z >= y
;y,z  - y >= x && z >= x
(define (largest-two a b c)
  (cond ((and 
          (>= a c) 
          (>= b c)) (list a b))
        ((and 
          (>= a b) 
          (>= c b)) (list a c))
        (else (list b c))))

(largest-two 1 2 3)
(largest-two 1 1 1)
(largest-two 3 2 1)
(largest-two 2 3 1)
(largest-two 2 1 3)
(largest-two 2 1 1)
(largest-two 1 2 1)
(largest-two 1 1 2)

(define (sum-of-squares x y)
  (+ (* x x)
     (* y y)))

(sum-of-squares  1 2)

; solution without using apply:
(define (sum-of-squares-of-largest-two a b c)
  (cond ((and 
          (>= a c) 
          (>= b c)) (sum-of-squares a b))
        ((and 
          (>= a b) 
          (>= c b)) (sum-of-squares a c))
        (else (sum-of-squares b c))))

(sum-of-squares-of-largest-two 1 2 3)
(sum-of-squares-of-largest-two 1 1 1)
(sum-of-squares-of-largest-two 1 2 1)
(sum-of-squares-of-largest-two 2 3 1)

; solution with apply
(define (sum-of-squares-of-largest-two-apply a b c)
  (apply sum-of-squares (largest-two a b c)))

(sum-of-squares-of-largest-two-apply 1 2 3)
(sum-of-squares-of-largest-two-apply 1 1 1)
(sum-of-squares-of-largest-two-apply 1 2 1)
(sum-of-squares-of-largest-two-apply 2 3 1)

;Exercise 1.4: Observe that our model of evaluation allows for combinations 
;whose operators are compound expressions. Use this observation to describe 
;the behavior of the following procedure:
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
;use the value of b to choose whether to add or subtract b. If b <= 0
;it is subtracted from a, which is the same result as a + }b}. If b > 0,
;it is added to a so a + |b| holds here as well

;ex 1.5
(define (p) (p)) ; recurse forever
(define (test x y)
  (if (= x 0) 0 y)) ; value is y if x is zero

; if arguments are evaluated in normal order,
; the this should exit with value 0, since the infinite
; loop from p is not entered - we expand all values before
; evaluating them, and the "tree" which contains (p) is not
; evaluated

; if in applicative order, then the infinite loop should be
; entered as p is evaluated before test is evaluated since
; all args are evaluated before the procedure is applied

; following enters infinite loop - applicative order
;(test 0 (p))

;ex 1.6
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

;What happens when Alyssa attempts to use this to compute square roots? Explain.
; the special form of if works with applicative order evaluation
; this version doesn't - so if we recurse in the else-clause and have a 
; terminating condition in the then-clause, we'll trigger an infinite loop
; regardless of inputs. for example, the following should terminate:
(if (= 0 0) 1 (p))

; but this should not
;(new-if (= 0 0) 2 (p))

;ex 1.7
(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y)
     2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 
     0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (my-sqrt x)
  (sqrt-iter 1.0 x))

; fails for small number - .001 provides a lower bound on the size of number that we can
; evaluate
(my-sqrt 0.000001)
; fails for a large number - we are never able to satisfy the condition in good-enough?:
;(my-sqrt 10000000000000)

; stop when ||lastguess|-|guess|| / lastguess is less than a lower bound value
; ie: guesses are not changing significantly between iterations
(define (good-enough-delta? guess lastguess x)
  (< (/ (abs (- (abs lastguess) (abs guess)))
        lastguess)
     0.0001))
     
(define (sqrt-iter-delta guess lastguess x)
  (if (good-enough-delta? guess lastguess x)
      guess
      (sqrt-iter-delta (improve guess x) guess x)))

(define (my-sqrt-delta x)
  (sqrt-iter-delta 1.0 0.0 x))

(my-sqrt-delta 9.0)
(my-sqrt-delta 25)

; large number
(my-sqrt-delta 100000000000000000000)
(square (my-sqrt-delta 100000000000000000000))

; small number
(my-sqrt-delta 0.00000001)
(square (my-sqrt-delta 0.00000001))
