;; 2520 is the smallest number that can be divided by
;; each of the numbers from 1 to 10 without any remainder.

;; What is the smallest positive number that is evenly divisible by all
;; of the numbers from 1 to 20?

;; a: 232792560



(define problem-5
  (lambda (init limit)
    (call/cc
     (lambda (brk)
       (letrec ((F (lambda (n i)
                     (cond
                      ((eq? i limit)
                       (brk n))
                      ((zero? (remainder n i))
                       (F n (+ i 1)))
                      (else (F (+ n 1) init))))))
         (F 1 1))))))

;; brute-force solution

(display (problem-5 1 20))
(display "\n")



