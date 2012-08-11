#lang r5rs
; http://cs.gettysburg.edu/~tneller/cs341/scheme-intro/index.html
;For practice, follow the examples above in extracting all of the letter symbols individually.   For more challenging practice, consider the same exercise with a mixture of lists of lists and dotted pairs:
;
;> (define challenge '(((a b) (c . d)) ((e . f) . (g h))))

(define challenge '(((a b) (c . d)) ((e . f) . (g h))))
(caaar challenge)
(car (cdr (car (car challenge))))
(car (car (cdr (car challenge))))
(cdr (car (cdr (car challenge))))
(car (car (car (cdr challenge))))
(cdr (car (car (cdr challenge))))
(car (cdr (car (cdr challenge))))
(car (cdr (cdr (car (cdr challenge)))))