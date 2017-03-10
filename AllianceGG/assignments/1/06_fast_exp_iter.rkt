#lang racket

; first, deal with trivial cases of 0^0, 0^n, n^0, n^1
; the power's binary format shows how to get the result by iteration
;
; example:
; the following recursive way
; x^77 <- x^76 <- x^38 <- x^19 <- x^18 <- x^9 <- x^8 <- x^4 <- x^2 <- x^1
; can be convertde into iteration with the help of 77's binary format of 1001101
; in detail,
; 1 the first bit always means sqr (x^1 -> x^2)
; 0 sqr (x^2 -> x^4)
; 0 sqr (x^4 -> x^8)
; 1 self-multiplication and then sqr ( (x^8 * x)^2 = x^18 )
; 1 self-multiplication and then sqr ( (x^18 * x)^2 = x^38 )
; 0 sqr (x^38 -> x^76)
; 1 the last bit means whether to have another self-multiplication (x^76 -> x^77)
;
; int->rBi: convert into binary format in REVERSED order.
; fast-exp-iter: the priming function call's postion is -1 since the very first 
;                calculation is always sqr(x^1). so -1 just means this case and 
;                triggers the following process.

[define [fast-exp base power]
  [define [int->rBi num rBi]
    [if [= 0 num]
      rBi
      [int->rBi [quotient num 2] [append rBi [list [remainder num 2]]]]]]
  [define [fast-exp-iter base sofar rBi cur]
    [cond
      [[= cur -1] [fast-exp-iter base [sqr sofar] rBi [- [length rBi] 2]]]
      [[= cur 0] [if [= [list-ref rBi 0] 0] sofar [* sofar base]]]
      [else [if [= [list-ref rBi cur] 0] [fast-exp-iter base [sqr sofar] rBi [- cur 1]]
              [fast-exp-iter base [sqr [* sofar base]] rBi [- cur 1]]]]]]
  [cond
    [[= 0 base] [if [= 0 power] [error "0^0 no solution"] [displayln 0]]]
    [[= 0 power] [displayln 1]]
    [[= 1 power] [displayln base]]
    [else [displayln [fast-exp-iter base base [int->rBi power empty] -1]]]]]

[define [myloop]
  [let [
        [a [read]]
        [b [read]]
        ]
    [if [eq? a eof]
        [void]
        [begin
          [fast-exp a b]
          [myloop]]]]]

[myloop]

