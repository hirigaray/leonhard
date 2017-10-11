#lang racket

; Problem #09:
; A Pythagorean triplet is a set of three natural numbers,
; a < b < c, for which,
; a^2 + b^2 = c^2

; For example, 3^2 + 4^2 = 5^2
;                9 +  16 = 25

; There exists exactly one Pythagorean triplet for which a + b + c = 1000.
; Find the product abc.

(define (pythagorean-triple? a b c)
  (and (< a b) (< b c)
       (equal? (+ (sqr a) (sqr b)) (sqr c))))

(define (special-triple? a b c)
  (and (pythagorean-triple? a b c)
       (equal? (+ a b c) 1000)))

(define (makes-pythagorean-triple a b)
  (let ((c (sqrt (+ (sqr a) (sqr b)))))
    (if (integer? c)
      (list a b c)
      #f)))

; Solution
(apply * (car (filter (curry apply special-triple?)
                      (filter (lambda (x) (not (false? x)))
                              (map (curry apply makes-pythagorean-triple)
                                   (cartesian-product (range 1 500) (range 1 500)))))))


