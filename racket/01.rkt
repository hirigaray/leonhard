#lang racket
; Problem #1
; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

; Find the sum of all the multiples of 3 or 5 below 1000.

(define checkfb
  (lambda (n)
    (cond
      ((= 0 (remainder n 3)) n)
      ((= 0 (remainder n 5)) n)
      (else 0))))

(display (foldl + 0 (map checkfb (range 1000))))
(newline)
