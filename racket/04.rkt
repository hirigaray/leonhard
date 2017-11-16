#lang racket

; Problem #4
; A palindromic number reads the same both ways. The largest palindrome
; made from the product of two 2-digit numbers is 9009 = 91 × 99.

; Find the largest palindrome made from
; the product of two 3-digit numbers.

(define (integer->list n)
  (let aux [(in n) (out '())]
    (if (zero? in)
      out
      (aux (quotient in 10) (cons (remainder in 10) out)))))

(define (palindrome-number? n)
  (let [(ln (integer->list n))]
    (equal? ln (reverse ln))))

; Solution
(apply max (filter palindrome-number?
                   (map (curry apply *)
                        (apply cartesian-product (make-list 2 (range 100 1000))))))
