#lang racket
[define [myloop]
  [define [mymax cur left]
    [if [= 1 left] 
      ; since the first num has been read in, the line stops when "left = 1"
      [displayln cur]
      [let [
            [next [read]]]
        [mymax [max cur next] [- left 1]]]]]
  [let [
        [n [read]]
        [first [read]]] ; read the first num to trigger comparison
    [if [eq? n eof]
      [void]
      [begin
          [mymax first n]
          [myloop]]]]]

[define a [read]] ; read off N
[myloop]
