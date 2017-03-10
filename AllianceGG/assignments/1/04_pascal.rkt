#lang racket
[define [pascal left cur]
  [if [= left 0]
    [void]
    [begin
      [myprint cur]
      [pascal [- left 1] [map + [cons 0 cur] [append cur '[0]]]]]]]

[define [myprint lst]
  [display [car lst]]
  [for [[i [cdr lst]]]
    [printf " ~a" i]]
  [newline]]

[define [myloop]
  [let
      [
       [cur [read]]]
    [if [eq? cur eof]
        [void]
        [begin
          [pascal cur '[1]]
          [myloop]]]]]

[myloop]
