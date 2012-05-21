;; a: 76576500

(define problem-12
  (lambda (len)
    (call/cc
     (lambda (brk)
       (letrec ([find-divs
                 (lambda (n)
                   (let ([sum 0]
                         [limit n])
                     (let loop ([i 1])
                       (if (< i limit)
                           (begin
                             (if (zero? (mod n i))
                                 (begin
                                   (set! limit (/ n i))
                                   (if (eq? limit i)
                                       (set! sum (+ sum 1))
                                       (set! sum (+ sum 2)))))
                             (loop (+ i 1)))) sum)))]
                [S (lambda (sum n)
                     (let ([t (+ sum n)])
                       (if (>= (find-divs t) len)
                           (brk t)
                           (S t (+ n 1)))))])
         (S 0 1))))))




