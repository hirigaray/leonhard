#lang racket

; Problem #16

; 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
; What is the sum of the digits of the number 2^1000?

(define (integer->list n)
  (let aux [(in n) (out '())]
    (if (zero? in)
      out
      (aux (quotient in 10) (cons (remainder in 10) out)))))

; Solution
(foldr + 0 (integer->list (expt 2 1000)))

