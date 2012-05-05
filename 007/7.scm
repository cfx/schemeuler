;; By listing the first six prime numbers:
;; 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

;; What is the 10 001st prime number?

;; a: 104743

(define (find-nth-prime th)
  (letrec ((F (lambda (init n)
                (let ((next-prime (+ n 1))
                      (next (+ init 1)))
                  (if (prime2? init)
                      (if (eq? next-prime th)
                          init
                          (F next next-prime))
                      (F next n))))))
    (F 3 1)))

(define (prime2? n)
  (letrec ((P (lambda (init)
                (cond
                 ((eq? (+ init 1) n) #t)
                 ((zero? (remainder n init)) #f)
                 (else (P (+ init 1)))))))
    (P 2)))


(define (prime? n)
  (letrec ((P (lambda (m)
                (if (eq? m 1)
                    #t
                    (if (zero? (remainder n m))
                        #f
                        (P (- m 1)))))))
    (P (- n 1))))


; 1000: 2.38s (prime?)
; 1000: 0.71s (prime2?)

(display (find-nth-prime 1000))
