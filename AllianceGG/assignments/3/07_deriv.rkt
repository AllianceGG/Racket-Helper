#lang racket

[define [variable? x]
  [symbol? x]]
[define [same-variable? x y]
  [and [variable? x] [variable? y] [eq? x y]]]
[define [sum? x]
  [and [pair? x] [member '+ x]]]
[define [addend x]
  [define [helper cur left]
    [if [eq? '+ [car left]]
      [if [= 1 [length cur]]
          [car cur]
          cur]
      [helper [append cur [list [car left]]] [cdr left]]]]
  [helper '[] x]]

[define [augend x]
  [let [
        [a [cdr [member '+ x]]]]
    [if [= 1 [length a]]
        [car a]
        a]]]
[define [product? x]
  [and [pair? x] [member '* x]]]
[define [multiplier x]
  [define [helper cur left]
    [if [eq? '* [car left]]
      [if [= 1 [length cur]]
          [car cur]
          cur]
      [helper [append cur [list [car left]]] [cdr left]]]]
  [helper '[] x]]
[define [multiplicand x]
  [let [[a [cdr [member '* x]]]]
    [if [= 1 [length a]]
        [car a]
        a]]]

[define [=number? x num]
  [and [number? x] [= x num]]]
[define [make-sum x y]
  [cond
    [[=number? x 0] y]
    [[=number? y 0] x]
    [[and [number? x] [number? y]] [+ x y]]
    ; hehe cases...
    [[and [pair? x] [pair? y]] [append x '[+] y]]
    [[and [pair? x] [not [pair? y]]] [append x '[+] [list y]]]
    [[and [not [pair? x]] [pair? y]] [cons x [append '[+] y]]]
    [[and [not [pair? x]] [not [pair? y]]] [list x '+ y]]]]
[define [make-product x y]
  [cond
    [[or [=number? x 0]  [=number? y 0]] 0]
    [[=number? x 1] y]
    [[=number? y 1] x]
    [[and [number? x] [number? y]] [* x y]]
    [else [list  x '* y]]]]
;// 在此处补充你的代码
(define (deriv exp var)
  (cond ((number? exp ) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum 
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        (else 
         (error "wrong format"))))

(define (myloop)
  (let ((a (read)))
    (if (eq? a eof)
        (void)
        (begin (display (deriv a 'x)) (newline) (myloop)))))

(myloop)
