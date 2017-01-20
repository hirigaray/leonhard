#lang racket

(require "recurse.rkt")

; 2520 is the smallest number that can be divided by each of the numbers
; from 1 to 10 without any remainder.

; What is the smallest positive number that is evenly divisible by all of
; the numbers from 1 to 20?

(define (all-true? l)
  (foldl (lambda (a b)
           (and a b))
         #t l))

(define (try-even-division-for-range n r)
  (map (lambda (d) (equal? 0 (remainder n d)))
       (range 1 r)))

(define (smallest-even-dividend-for-range r)
  (recurse (aux in out) ('(#f) 1)
    (if (all-true? in)
      (- out 1)
      (aux (try-even-division-for-range out r) (+ 1 out)))))

; Solution
(smallest-even-dividend-for-range 20)
