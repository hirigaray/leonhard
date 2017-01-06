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

(define collatz
  (lambda (x)
    (cond
      ((= x 1) 1)
      ((= 0 (remainder x 2)) (/ x 2))
      (else (+ 1 (* x 3))))))

(define collatz-length
  (lambda (x)
    (letrec
      ((aux (lambda (n l)
              (if (= n 1)
                l
                (aux (collatz n) (+ l 1))))))
        (aux x 0))))

(define collatz-longest-chain-with-limit
  (lambda (sn)
    (letrec
      ((aux (lambda (n cl)
              (if (= n 0)
                cl
                (let ((new (collatz-length n)))
                  (if (> new (cdr cl))
                    (aux (- n 1) (cons n new))
                    (aux (- n 1) cl)))))))
      (aux sn (cons 0 0)))))

(display (collatz-longest-chain-with-limit 1000000))
