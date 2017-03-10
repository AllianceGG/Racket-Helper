#lang racket
[define [fast-exp base power ans]
  [cond
    [[= 0 power] ans]
    [[even? power] [fast-exp [sqr base] [/ power 2] ans]]
    [else [fast-exp base [- power 1] [* ans base]]]]]

[define [myloop]
  [let [
        [a [read]]
        [b [read]]
        ]
    [if [eq? a eof]
        [void]
        [begin
          [if [and [= 0 a] [= 0 b]]
            [displayln "no answer"]
            [displayln [fast-exp a b 1]]]
          [myloop]]]]]

[myloop]

