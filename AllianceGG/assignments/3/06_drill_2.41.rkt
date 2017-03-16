#lang racket

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq) (accumulate op init (cdr seq)))))

(define (enumerate-interval a b)
  (if (> a b)
      '()
      (cons a (enumerate-interval (+ a 1) b))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))


(define (tri-num-list n s)
  ; @author: 刘时煜
  (define (make-list n)
    (flatmap (lambda(i)
               (flatmap (lambda(j)
                          (map (lambda(k)
                                 (list i j k))
                               (enumerate-interval (+ 1 j) n)))
                        (enumerate-interval (+ 1 i) n)))
             (enumerate-interval 1 n)))
  (filter (lambda (x) (= s (accumulate + 0 x) ) ) (make-list n) )
)
;// 在此处补充你的代码
(define (myloop)
  (let ((n (read))
        (s (read)))
    (if (eq? n eof)
        (void)
        (begin (display (tri-num-list n s)) (newline) (myloop)))))

(myloop)

