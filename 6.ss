; Problem #6:
; Find the difference between the sum of the squares of
; the first one hundred natural numbers and the square of the sum.

(define square
  (lambda (x)
    (* x x)))

(define sum-aux
  (lambda (in out)
    (if (null? in)
      out
      (sum-aux (+ (car in) (sum-aux (cdr in)))))))

(define sum
  (lambda (l)
    (sum-aux l '())))

(display
  (-
    (square (sum (iota 101)))
    (sum (map square (iota 101)))))

(newline)
