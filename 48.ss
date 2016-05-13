(use-modules (srfi srfi-1))

(define self-power
  (lambda (n)
   (expt n n)))

(display (fold + 0 (map self-power (cdr (iota 1001)))))
