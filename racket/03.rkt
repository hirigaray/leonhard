#lang racket

; Problem #3
; The prime factors of 13195 are 5, 7, 13 and 29.
; What is the largest prime factor of the number 600851475143 ?

(define (factorize n)
  (let aux [(x n) (div 2) (out '())]
    (cond
      [(= x 1) out]
      [(= 0 (remainder x div)) (aux (/ x div) div (cons div out))]
      [else (aux x (+ div 1) out)])))

; Solution
(car (factorize 600851475143))
