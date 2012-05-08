;; a: 1366

(let ([sum 0])
  (string-for-each
   (lambda (e)
     (set! sum (+ sum (string->number (string e)))))
   (number->string (expt 2 1000))) sum)
