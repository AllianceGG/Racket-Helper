#lang racket
[define [flip x]
  [if [pair? x]
      [map flip [reverse x]]
      x]]

[define [myloop]
  [let [
        [a [read]]]
    [if [eq? a eof]
        [void]
        [begin
          [displayln [flip a]]
          [myloop]]]]]

[myloop]
