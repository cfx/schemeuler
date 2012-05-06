;; a: 4782

(define (problem-25 len)
  (call/cc
   (lambda (brk)
     (letrec ((fib (lambda (prev n init limit)
                     (if (eq? init limit)
                         (+ prev n)
                         (fib n (+ prev n) (+ init 1) limit))))
              (F (lambda (init)
                   (if (>= (string-length (number->string (fib 0 1 2 init)))
                           len)
                       (brk init)
                       (F (+ init 1))))))
       (F 3)))))


(display (problem-25 1000))
(display "\n")
