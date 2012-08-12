486
(+ 137 349)
(- 1000 334)
(* 5 99)
(/ 10 5)
(+ 2.7 10)
(+ 21 35 12 7)
(* 25 4 12)

; p32
(+ 
 (* 3 5)
 (- 10 6))

(+ (* 3
    (+ (* 2 4)
       (+ 3 5)))
   (+ (- 10 7)
      6))

;p33
(define size 2)
size
(* 5 size)
(define pi 3.14159)
(define radius 10)
(* pi (* radius radius))
(define circumference (* 2 pi radius))
circumference

;p38
(define (square x)
  (* x x))
(square 2)

; ignores first two expressions - returns last
(define (body-as-sequence a b c)
  (+ a 1)
  (+ b 2)
  (+ c 3))

(body-as-sequence 10 11 12)

;p39

(square (+ 2 5))

(square (square 3))

(define (sum-of-squares x y)
  (+ (square x)
     (square y)))

(sum-of-squares 3 4)

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

(f 5)