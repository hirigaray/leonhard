#lang racket

(require math/number-theory)

; Problem #07
; By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13
; we can see that the 6th prime is 13.

; What is the 10001st prime number?

(define (generate-nth-prime n)
  (let aux [(in 1) (out 1)]
    (cond
      [(not (prime? out)) (aux in (+ 1 out))]
      [(not (equal? n in)) (aux (+ 1 in) (+ 1 out))]
      [else out])))

; Solution
(generate-nth-prime 10001)
