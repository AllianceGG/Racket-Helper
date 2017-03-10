#lang racket
[define [fool out in]
  [for [
        [i out]] ; (0, 1, ..., (out-1))
    [for [
          [j [in-range 1 [+ 1 in]]]]
      [printf "~a," j]]
    [newline]]]

[define [myloop]
  [let [
        [o [read]]
        [i [read]]]
    [if [eq? o eof]
      [void]
      [begin
        [fool o i]
        [myloop]]]]]

[myloop]
