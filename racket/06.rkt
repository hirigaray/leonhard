#lang racket

; Problem #6:
; Find the difference between the sum of the squares of
; the first one hundred natural numbers and the square of the sum.

(define sum
  (lambda (l)
    (apply + l)))

(define square
  (lambda (x)
    (* x x)))

(define squareofsum-minus-sumofsquares
   (lambda (n)
     (let ((l (range n)))
       (- (square (sum l))
          (sum (map square l))))))

; Solution
(squareofsum-minus-sumofsquares 101)
