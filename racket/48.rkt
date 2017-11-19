#lang racket

; Problem #48
; The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

; Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

(require "aux.rkt")

(define (self-power n)
  (expt n n))

; Solution
(let* [(sum (foldl + 0 (map self-power (range 1 1001))))
       (digits (integer->list sum))]
  (list->integer (take-right digits 10)))
