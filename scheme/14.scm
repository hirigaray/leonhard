(define collatz
  (lambda (n)
    (cond
      ((= n 1) 1)
      ((= 0 (remainder n 2)) (/ n 2))
      (else (+ 1 (* n 3))))))

(define collatz-length-aux
  (lambda (n cl)
    (if (= n 1)
      cl
      (collatz-length-aux
        (collatz n)
        (+ cl 1)))))

(define collatz-length
  (lambda (n)
    (collatz-length-aux n 0)))

(define clz-longest-chain-aux
  (lambda (hn cl)
    (if (= hn 0)
      cl
      (let ((new (collatz-length hn)))
        (if (> new (cdr cl))
          (clz-longest-chain-aux (- hn 1) (cons hn new))
          (clz-longest-chain-aux (- hn 1) cl))))))

(define clz-longest-chain
  (lambda (hn)
    (clz-longest-chain-aux hn (cons 0 0))))

(display (clz-longest-chain 1000000))
(newline)
