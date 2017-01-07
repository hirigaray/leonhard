#lang racket

(require "recurse.rkt")

; Problem #3
; The prime factors of 13195 are 5, 7, 13 and 29.
; What is the largest prime factor of the number 600851475143 ?

(define (factorize n)
  (recurse (aux x div out) (n 2 '())
    (if (= x 1)
      out
      (if (= 0 (remainder x div))
        (aux (/ x div) div (cons div out))
        (aux x (+ div 1) out)))))

; Solution
(car (factorize 600851475143))
