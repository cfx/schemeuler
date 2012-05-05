;; 2520 is the smallest number that can be divided by
;; each of the numbers from 1 to 10 without any remainder.

;; What is the smallest positive number that is evenly divisible by all
;; of the numbers from 1 to 20?

;; 27720

(define (divby1? n m)
  (if (zero? n)
      #t
      (and (zero? (remainder m n))
           (divby1? (- n 1) m))))

(divby1? 20 232792560)

(define (divby? init limit m)
  (cond
   ((zero? (remainder m init))
    (cond
     ((= init limit) #t)
     (else (divby? (+ init 1) limit m))))
   (else #f)))

(divby? 1 11 2530)

(define (find-smallest-for n m)
  (if (divby1? n m)
      m
      (find-smallest-for n (+ m 1))))

(define (final init limit m)
  (let ((result (find-smallest-for init m)))
    (if (= init limit)
        result
        (final (+ init 1) limit result))))

(final 19 19 24504480)
