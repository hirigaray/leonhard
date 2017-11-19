#lang racket

; Auxiliary library.

(provide integer->list
         list->integer)

(define (integer->list n)
  (let aux [(in n) (out '())]
    (if (zero? in)
      out
      (aux (quotient in 10) (cons (remainder in 10) out)))))

(define (list->integer l)
  (let aux [(in l) (out 0)]
    (if (null? in)
      out
      (aux (cdr in) (+ (car in) (* 10 out))))))

