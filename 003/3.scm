;; The prime factors of 13195 are 5, 7, 13 and 29.
;; What is the largest prime factor of the number 600851475143?
;;
;; the answer is: 6857


(define problem-3
  (let ([l 2])
    (lambda (n)
      (call/cc
       (lambda (brk)
         (letrec ((find-prime-factor
                   (lambda (n m)
                     (cond
                      ((eq? (/ n m) 1)
                       (begin
                         (check-prime-factor m)
                         (brk l)))
                      ((zero? (remainder n m))
                       (begin
                         (check-prime-factor m)
                         (find-prime-factor (/ n m) m)))
                      (else (find-prime-factor n (+ m 1))))))
                  (check-prime-factor
                   (lambda (m)
                     (if (> m l)
                         (set! l m)))))
           (find-prime-factor n l)))))))


(display (problem-3 600851475143))
(display "\n")
