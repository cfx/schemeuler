;; A palindromic number reads the same both ways.
;; The largest palindrome made from the product of two 2-digit numbers is
;; 9009 = 91 99.
;;
;; Find the largest palindrome made from the product of two 3-digit numbers.

;; a: 906609


(define find-pali-for
  (lambda (n1 n2)
    (call/cc
     (lambda (brk)
       (if (eq? 100 n1)
           (brk n2)
           (if (pali? (* n1 n2))
               (* n1 n2)
               (find-pali-for (- n1 1) n2)))))))


(define problem-4
  (lambda (n1 n2 pali)
    (call/cc
     (lambda (brk)
       (let ((new-p (find-pali-for n1 n2)))
         (if (eq? 100 (- n2 1))
             (brk pali)
             (if (> new-p pali)
                 (problem-4 n1 (- n2 1) new-p)
                 (problem-4 n1 (- n2 1) pali))))))))



(define (pali? n)
  (let ((s (number->string n)))
    (cond
     ((eq? (string-length s) 6)
      (and (equal? (string-ref s 0) (string-ref s 5))
           (equal? (string-ref s 1) (string-ref s 4))
           (equal? (string-ref s 2) (string-ref s 3))))
     (else
      (and (equal? (string-ref s 0) (string-ref s 4))
           (equal? (string-ref s 1) (string-ref s 3)))))))


(display (problem-4 999 999 999))
(display "\n")

