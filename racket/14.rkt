#lang racket

(require "recurse.rkt")

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

(define collatz
  (lambda (n)
    (cond
      ((= n 1) 1)
      ((= 0 (remainder n 2)) (/ n 2))
      (else (+ 1 (* n 3))))))

(define (collatz-length n)
  (recurse (aux in out) (n 0)
    (if (= in 1)
      out
      (aux (collatz in) (+ out 1)))))

(define (collatz-longest-chain-with-limit lim)
  (recurse (aux in out) (lim '(0 . 0))
    (if (= in 0)
      out
      (let ((new (collatz-length in)))
        (if (> new (cdr out))
          (aux (- in 1) (cons in new))
          (aux (- in 1) out))))))

; Solution
(collatz-longest-chain-with-limit 1000000)
