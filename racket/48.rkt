#lang racket
; Problem #48
; The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

; Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

(define self-power
  (lambda (n)
   (expt n n)))

(display (foldl + 0 (map self-power (cdr (range 1001)))))
(newline)
