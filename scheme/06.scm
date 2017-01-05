; Problem #6:
; Find the difference between the sum of the squares of
; the first one hundred natural numbers and the square of the sum.

(define square
  (lambda (x)
    (* x x)))

(define sum
  (lambda (l)
    (if (null? l)
      0
      (+ (car l)
         (sum (cdr l))))))

(define sqrtofsum-minus-sumofsqrts
  (lambda (n)
    (- (square (sum (iota n)))
       (sum (map square (iota n))))))

(display (sqrtofsum-minus-sumofsqrts 101))
(newline)
