;; If we list all the natural numbers below 10 that
;; are multiples of 3 or 5, we get 3, 5, 6 and 9.
;; The sum of these multiples is 23.

;; Find the sum of all the multiples of 3 or 5 below 1000.

;; A: 233168


(define problem-1
  (let ((sum 0))
    (lambda (m)
      (call/cc
       (lambda (brk)
         (letrec ((S (lambda (n)
                       (if (>= n m)
                           (brk sum)
                           (begin
                             (C n)
                             (S (+ n 1))))))
                  (C (lambda (n)
                       (if (or (zero? (mod n 3))
                               (zero? (mod n 5)))
                           (set! sum (+ sum n))))))
           (S 1)))))))


(display (problem-1 5000000))
(display "\n")
