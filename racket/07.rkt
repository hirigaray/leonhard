#lang racket

(require
  math/number-theory
  "recurse.rkt")

; Problem #07
; By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13
; we can see that the 6th prime is 13.

; What is the 10001st prime number?

(define (generate-nth-prime n)
  (recurse (aux in out) (1 1)
    (if (prime? out)
      (if (equal? n in)
        out
        (aux (+ 1 in) (+ 1 out)))
      (aux in (+ 1 out)))))

(generate-nth-prime 10001)
