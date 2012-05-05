;; A: 142913828922

(define (each fn i v)
  (if (= i (vector-length v))
      v
      (begin
        (fn i v)
        (each fn (+ i 1) v))))

(define (rem i int limit v)
  (let ((s (+ i int)))
    (if (>= s limit)
        v
        (if (eq? (vector-ref v s) 'o)
            (begin
              (vector-set! v s 'x)
              (rem s int limit v))
            (rem s int limit v)))))



(define (sum-of-primes vsize)
  (let ((reduced (each
                  (lambda (i v)
                    (rem i (+ i 1) vsize v))
                  1
                  (make-vector vsize 'o)))
        (sum 0)
        (i 1))
    (vector-for-each (lambda (e)
                       (begin
                         (if (eq? e 'o)
                             (set! sum (+ sum i)))
                         (set! i (+ i 1)))) reduced)
    (- sum 1)))

(display (sum-of-primes 2000000))
(display "\n")

(define (sum-of-primes vsize)
  (let ((ii 1)
        (v (make-vector vsize 'o)))
    (let ((reduced (vector-for-each
                    (lambda (e)
                      (debug)
                      (set! ii (+ ii 1))
                      (rem (- ii 1) ii vsize v)) v))
          (sum 0)
          (j 1))
      (vector-for-each (lambda (e)
                         (begin
                           (if (eq? e 'o)
                               (set! sum (+ sum j)))
                           (set! j (+ j 1)))) reduced)
      (- sum 1))))
