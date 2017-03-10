#lang racket
[define [flatten x]
  [cond
    [[null? x] x]
    [[pair? x] [append [flatten [car x]] [flatten [cdr x]]]]
    [else [list x]]]] ; the only case as "else": a simple number

[define [main]
  [let [
        [a [read]]]
    [if [eq? a eof]
        [void]
        [begin
          [displayln [flatten a]]
          [main]]]]]

[main]
