#lang racket
[define [sup-fib goal]
  [define [sup-fib-iter a b c d e cur]
    [if [>= cur goal]
      a
      [sup-fib-iter b c d e [- [+ e [* 4 d] [* 5 c] [* a a a]] [* 2 b b]]]]]
  [sup-fib-iter 1 1 1 1 1 0]]

[define [myloop]
  [let [
       [cur [read]]]
    [if [eq? cur eof]
        [void]
        [begin
          [sup-fib cur]
          [myloop]]]]]

[myloop]
