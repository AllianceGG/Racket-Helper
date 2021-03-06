#lang racket

(define (average x y) (/ (+ x y) 2))

(define (iterative-improve good-enough improve)
  (define (improve-fun guess)
    (if (good-enough guess)
        guess
        (improve-fun (improve guess))))
  improve-fun)

(define (sqrt a)
  (define (gd x)
    (< (abs (- x (average x (/ a x)))) 0.0001))
  (define (im x)
    (average x (/ a x)))
  ((iterative-improve gd im) 1))

(define (myloop)
  (let ((n (read)))
    (if (eq? n eof)
        (void)
        (begin (display (sqrt n)) 
               (newline) (myloop)))))

(myloop)