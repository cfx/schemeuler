;; Answer: 648

(define (problem-20)
  (letrec ((! (lambda (n)
                (if (zero? n)
                    1
                    (* n (! (- n 1)))))))
    (fold-left (lambda (sum e)
                 (+ sum e))
               0
               (map (lambda (c) (- (char->integer c) 48))
                    (string->list (number->string (! 100)))))))

(display (problem-20))
(display "\n")
