#lang racket

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq) (accumulate op init (cdr seq)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

[define [safe? k pos]
  [if [= 1 [length pos]]
    #t
    [if [or [= [car pos] [last pos]] [= [- k 1] [abs [- [car pos] [last pos]]]]]
      #f
      [safe? [- k 1] [cdr pos]]]]]

[define [queens size]
  ;[define empty-board '[]]
  [define [queen-cols k]
    [if [= k 0]
      ;[list empty-board]
      '[[]]
      [filter
        [lambda [pos] [safe? k pos]]
        [flatmap
          ; proc in this flatmap
          [lambda [already]
            [map
              [lambda [new-row] [append already [list new-row]]]

              ; numbers are from 1 to 8
              [range 1 [+ 1 size]]
            ]
          ]

          ; obj to be operated by this flatmap
          [queen-cols [- k 1]]
        ]
      ]
    ]
  ]
  [queen-cols size]
]

[define answer [queens 8]]

; read off the number of groups
[read]

[define [printlst lst]
  [if [null? lst]
    [newline]
    [begin [print [car lst]] [printlst [cdr lst]]]]]

[define [myloop]
  [let [[a [read]]]
    [if [eq? eof a]
      [void]
      [begin [printlst [list-ref answer [- a 1]]] [myloop]]]]]

[myloop]
