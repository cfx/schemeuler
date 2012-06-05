;;; a: 837799

(define problem-14
  (lambda (n)
    (letrec ([t 0]
             [h (make-eqv-hashtable)]
             [S (lambda (n fn)
                  (cond
                   ((eq? n 1) (fn n 1))
                   ((hashtable-ref h n #f)
                    (fn n (hashtable-ref h n 0)))
                   ((odd? n)
                    (odd-seq n fn))
                   (else (even-seq n fn))))]
             [even-seq
              (lambda (n fn)
                (S (/ n 2) (col n fn)))]
             [odd-seq
              (lambda (n fn)
                (S (+ 1 (* 3 n)) (col n fn)))]
             [col (lambda (n fn)
                    (lambda (ref val)
                      (let ()
                        (hashtable-set! h ref val)
                        (set-t ref val)
                        (fn n (+ val 1)))))]
             [set-t (lambda (ref val)
                      (if (< (hashtable-ref h t 0) val)
                          (set! t ref)))])
      (let loop ([n n])
        (if (eq? n 1)
            t
            (let ()
              (S n (lambda (ref val)
                     (let ()
                       (hashtable-set! h ref val)
                       (set-t ref val)
                       (hashtable-ref h ref 0))))
              (loop (- n 1))))))))

(display (problem-14 100000))
