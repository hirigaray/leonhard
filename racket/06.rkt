#lang racket

; Problem #6:
; Find the difference between the sum of the squares of
; the first one hundred natural numbers and the square of the sum.

; Solution
(let [(l (range 100))]
  (- (sqr (foldr + 0 l))
     (foldr + 0 (map sqr l))))
