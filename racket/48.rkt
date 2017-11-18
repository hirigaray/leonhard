#lang racket

; Problem #48
; The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

; Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

(define (self-power n)
  (expt n n))

(define (integer->list n)
  (let aux ((in n) (out '()))
    (if (zero? in)
      out
      (aux (quotient in 10) (cons (remainder in 10) out)))))

; Solution
(let [(series-sum (integer->list (foldl + 0 (map self-power (range 1 1001)))))]
  (drop series-sum (- (length series-sum) 10)))
