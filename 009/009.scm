;; a: 31875000

(let ([t-sum 1000])
  (call/cc
   (lambda (brk)
     (let loop-a ([a 1])
       (let loop-b ([b (+ a 1)])
         (let ([c2 (+ (expt a 2) (expt b 2))])
           (let ([sum (+ a b (sqrt c2))])
             (cond
              ((> sum t-sum) #f)
              ((eq? sum t-sum)
               (brk (* a b (sqrt c2))))
              (else (loop-b (+ b 1)))))))
       (if (> a t-sum)
           #f
           (loop-a (+ a 1)))))))
