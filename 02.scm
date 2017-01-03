(use-modules (srfi srfi-1))
(define get-evens
  (lambda (n)
  (if (even? n)
    n
    0)))

(define fibonacci
  (lambda (n)
  (if (< n 2)
    n
    (+ (fibonacci (- n 1)) (fibonacci (- n 2))))))

(display (fold + 0 (map get-evens (map fibonacci (iota 34)))))
(newline)
