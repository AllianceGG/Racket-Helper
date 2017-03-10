#lang racket
(define (myloop lst)
  (let
      ((cur (read)))
    (if (eq? cur eof)
        (myprint (remove-duplicates (sort lst <)))
        (myloop (append lst (list cur))))))

(define (myprint lst)
  (display (car lst))
  (for (
        (i (cdr lst)))
    (printf " ~a" i)))

(myloop '())
