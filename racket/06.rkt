#lang racket

; Problem #6:
; Find the difference between the sum of the squares of
; the first one hundred natural numbers and the square of the sum.

(define (sum l)
  (apply + l))

; Solution
(let ((l (range 100)))
  (- (sqr (sum l))
     (sum (map sqr l))))
