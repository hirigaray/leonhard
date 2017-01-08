#lang racket

(require "recurse.rkt")

; Problem #4
; A palindromic number reads the same both ways. The largest palindrome
; made from the product of two 2-digit numbers is 9009 = 91 × 99.

; Find the largest palindrome made from
; the product of two 3-digit numbers.

(define (integer->list n)
  (recurse (aux in out) (n '())
    (if (zero? in)
      out
      (aux (quotient in 10) (cons (remainder in 10) out)))))

(define palindrome-number?
  (lambda (n)
    (let* ((l (integer->list n))
           (first-half
             (take l (floor (/ (length l) 2))))
           (backwards-rest
             (take (reverse l) (floor (/ (length l) 2)))))
      (foldl (lambda (a b)
               (and a b))
             #t
             (map equal? first-half backwards-rest)))))

; Solution
(apply max
       (filter palindrome-number?
               (map (curry apply *)
                    (apply cartesian-product (make-list 2 (range 100 1000))))))
