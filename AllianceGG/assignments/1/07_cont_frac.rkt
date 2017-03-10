#lang racket
[define [cont-frac-iter N D k]
  [define [real-op k res]
    [if [= 0 k]
      res
      [real-op N D [- k 1] [/ [N k] [+ res [D k]]]]]]
  [real-op k 0]]
