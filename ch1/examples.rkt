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

;p44
(define (my-abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(my-abs 10)
(my-abs 0)
(my-abs -10)

(define (my-abs2 x)
  (cond ((< x 0) (- x))
        (else x)))

(my-abs2 10)
(my-abs2 0)
(my-abs2 -10)

(define (my-abs3 x)
  (if (< x 10)
      (- x)
      x))

(my-abs3 10)
(my-abs3 0)
(my-abs3 -10)

(define (in-range t l u)
  (and (> t l)
       (< t u)))

(in-range 5 1 10)
(in-range 1 3 10)