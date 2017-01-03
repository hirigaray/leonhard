; Problem #3
; The prime factors of 13195 are 5, 7, 13 and 29.
; What is the largest prime factor of the number 600851475143 ?

; factorize n via brute force
(define factorize
  (lambda (n)
    (letrec
      ((aux (lambda (x div out)
              (if (= x 1)
                out
                (if (= 0 (modulo x div))
                  (aux (/ x div) div (cons div out))
                  (aux x (+ div 1) out))))))
       (aux n 2 '()))))

(display (car (factorize 600851475143)))
(newline)
