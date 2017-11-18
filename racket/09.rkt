#lang racket

; Problem #09:
; A Pythagorean triplet is a set of three natural numbers,
; a < b < c, for which,
; a^2 + b^2 = c^2

; For example, 3^2 + 4^2 = 5^2
;                9 +  16 = 25

; There exists exactly one Pythagorean triplet for which a + b + c = 1000.
; Find the product abc.

(define (pythagorean-triplet? a b c)
  (and (< a b c)
       (equal? (sqrt (+ (sqr a) (sqr b))) c)))

(define (special-triplet? a b c)
  (and (pythagorean-triplet? a b c)
       (equal? (+ a b c) 1000)))

(define (makes-pythagorean-triplet? a b)
  (let ((c (sqrt (+ (sqr a) (sqr b)))))
    (and (integer? c) (list a b c))))

; Solution
(apply * (car (filter (curry apply special-triplet?)
                      (filter-map (curry apply makes-pythagorean-triplet?)
                                  (cartesian-product (range 1 500) (range 1 500))))))
