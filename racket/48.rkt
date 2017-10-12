#lang racket

; Problem #48
; The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

; Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

(define (sum l)
  (apply + l))

(define (self-power n)
  (expt n n))

(define (integer->list n)
  (let aux ((in n) (out '()))
    (if (zero? in)
      out
      (aux (quotient in 10) (cons (remainder in 10) out)))))

; Solution
(let ((series-sum
        (integer->list
          (sum (map self-power (cdr (range 1001)))))))
  (drop series-sum (- (length series-sum) 10)))
