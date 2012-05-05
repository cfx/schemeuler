;; The sum of the squares of the first ten natural numbers is,
;;
;; 12 + 22 + ... + 102 = 385
;; The square of the sum of the first ten natural numbers is,
;;
;; (1 + 2 + ... + 10)2 = 552 = 3025
;; Hence the difference between the sum of the squares of the first ten
;; natural numbers and the square of the sum is 3025  385 = 2640.

;; Find the difference between the sum of the squares of the first
;; one hundred natural numbers and the square of the sum.
;; a: 25164150


(define problem-6
  (lambda (n)
    (letrec ((S (lambda (fn n)
                  (if (eq? n 1)
                      1
                      (fn n))))
             (sum-of-sq
              (lambda (n)
                (+ (expt n 2)
                   (S sum-of-sq
                      (- n 1)))))
             (sq-of-sum
              (lambda (n)
                (+ n (S sq-of-sum
                        (- n 1))))))
      (- (expt (S sq-of-sum n) 2)
         (S sum-of-sq n)))))

(display (problem-6 100))
(display "\n")

