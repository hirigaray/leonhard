#lang racket

; Problem #14
; The following iterative sequence is defined for the set of positive
; integers:

; n -> n/2 (n is even)
; n -> 3n + 1 (n is odd)

; Using the rule above and starting with 13,
; we generate the following sequence:

; 13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1
; It can be seen that this sequence (starting at 13 and finishing at 1)
; contains 10 terms. Although it has not been proved yet (Collatz Problem),
; it is thought that all starting numbers finish at 1.

; Which starting number, under one million, produces the longest chain?

; NOTE: Once the chain starts the terms are allowed to go above one million.

(define (collatz n)
  (cond
    [(= n 1) 1]
    [(even? n) (/ n 2)]
    [(odd? n) (+ 1 (* n 3))]))

(define (collatz-length n)
  (let aux ((in n) (out 0))
    (if (= in 1)
      out
      (aux (collatz in) (+ out 1)))))

(define (collatz-longest-chain-with-limit lim)
  (let aux ((in lim) (out '(0 0)))
    (let ((new (collatz-length in)))
      (cond
        [(= in 0) out]
        [(> new (cdr out)) (cons in new)]
        [else (aux (- in 1) out)]))))

; Solution
(collatz-longest-chain-with-limit 1000000)
