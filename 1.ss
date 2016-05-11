(define checkfb
  (lambda (n)
    (cond
      ((= 0 (remainder n 3)) n)
      ((= 0 (remainder n 5)) n)
      (else 0))))

(define sum-list 
  (lambda (l)
    (if (null? l)
      0
    (+ (car l) 
       (sum-list (cdr l))))))

(display (sum-list (map checkfb (iota 1000))))
(newline)
