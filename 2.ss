(define sum-list 
  (lambda (l)
    (if (null? l)
      0
    (+ (car l) 
       (sum-list (cdr l))))))

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

(display (sum-list (map get-evens (map fibonacci (iota 34)))))
(newline)
