;; pure functional solution

(define problem-1.1
  (lambda (m)
    (call/cc
     (lambda (brk)
       (letrec ((S (lambda (n sum)
                     (if (>= n m)
                         (brk sum)
                         (let ([new-sum (C n sum)])
                           (S (+ n 1) new-sum)))))
                (C (lambda (n sum)
                     (if (or (zero? (mod n 3))
                             (zero? (mod n 5)))
                         (+ sum n)
                         sum))))
         (S 1 0))))))

(display (problem-1.1 5000000))
(display "\n")
