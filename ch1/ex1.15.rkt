(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (pwrap (sine (/ angle 3.0)))))

(define (pwrap x)
  (display "passed ")(display x)(newline)
  (p x))

(define (logb x b)
  (/ (log x) (log b)))

(define b 3)

(define (sine-and-log x)
  (sine x)
  (display "log ")(display x)(display "= ")(display (logb x b)) (newline))

(sine-and-log 100)
(sine-and-log 1000)
(sine-and-log 10000)
(sine-and-log 100000)
(sine-and-log 1000000)

; sine(a) grows at ~ log_3(a)