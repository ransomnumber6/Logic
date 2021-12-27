#lang racket
;Title  : Scheme FullAdder
;Desc   : Using scheme to create logic gates and adder functions
;Author : Trevor Ransom
;Date   : 12-08-2021

; and gate
(define l-and(lambda (a b)
  (cond ((=(+ a b)2)1)
        (else 0)
        )
  )
  )
; and test cases
(displayln "AND test cases")
(display "AND(0 1): ")
(l-and 0 1)
(display "AND(1 0): ")
(l-and 1 0)
(display "AND(1 1): ")
(l-and 1 1)
(display "AND(0 0): ")
(l-and 0 0)
(displayln "")

; not gate
(define l-not (lambda (a)
                (cond((= a 0)1)
                     (else 0)
                     )
                )
  )
; not test cases
(displayln "NOT test cases")
(display "NOT(0): ")
(l-not 0)
(display "NOT(1): ")
(l-not 1)
(displayln "")

; or gate
(define l-or (lambda (a b)
                    (cond ((>(+ a b)0)1)
                          (else 0)
                          )
                    )
  )

; or test cases
(displayln "OR test cases")
(display "OR(0 1): ")
(l-or 0 1)
(display "OR(1 0): ")
(l-or 1 0)
(display "OR(1 1): ")
(l-or 1 1)
(display "OR(0 0): ")
(l-or 0 0)
(displayln "")

; exclusive or gate
(define l-xor (lambda (a b)
                (cond ((=(+ a b)1)1)
                      (else 0)
                      )
                )
  )

; xor test cases
(displayln "XOR test cases")
(display "XOR(0 1): ")
(l-xor 0 1)
(display "XOR(1 0): ")
(l-xor 1 0)
(display "XOR(1 1): ")
(l-xor 1 1)
(display "XOR(0 0): ")
(l-xor 0 0)
(displayln "")

; fulladder function
(define fulladder (lambda (x a b)
  (cons(l-xor(l-xor a b) x)
       (l-or(l-and a b)(l-and(l-xor a b)x))
       )
  )
  )

;adder test cases
(displayln "Full Adder test cases")
(display "fullladdr(0 0 0): ")
(fulladder 0 0 0)
(display "fullladdr(0 0 1): ")
(fulladder 0 0 1)
(display "fullladdr(0 1 0): ")
(fulladder 0 1 0)
(display "fullladdr(0 1 1): ")
(fulladder 0 1 1)
(display "fullladdr(1 0 0): ")
(fulladder 1 0 0)
(display "fullladdr(1 0 1): ")
(fulladder 1 0 1)
(display "fullladdr(1 1 0): ")
(fulladder 1 1 0)
(display "fullladdr(1 1 1): ")
(fulladder 1 1 1)
(displayln "")

;n bit adder
(define n-bit-addr (lambda (a b c)
  ; returns a pair containing a list and a carry. 
  (doadder
  ; function to add lists
   (reverse-list a) 
   (reverse-list b) 
   c                
   '()              
   )
  )
)

; taking three lists 1 carry
(define doadder (lambda (a b c nl)
   (cond ((= (length a) 0) (cons nl c))
   (else (doadder
          (cdr a)                                      
          (cdr b)   
          (cdr (fulladder (car a) (car b) c))           
          (cons (car (fulladder (car a) (car b) c)) nl)
         ))
   ))
)

; Accepts a list to reverse and an empty list
(define reverse (lambda (l nl)
   (cond ((= (length l) 0) nl) 
         (else (reverse (cdr l) (cons (car l) nl))
               )
         )
   )
)

; reverses list using the reverse function for n-bit-addr
(define reverse-list (lambda (l)
 (cond ((= (length l) 0) l)
       (else (reverse (cdr l) (cons (car l) '())))
       )
 )
)

; n-bit-adder test cases
(displayln "n-bit-adder test cases")
(display "n-bit-addr '(0 1 0) '(0 1 1) 1): ")
(n-bit-addr '(0 1 0) '(0 1 1) 1)
(display "n-bit-addr '(1 1 1) '(0 0 0) 1)): ")
(n-bit-addr '(1 1 1) '(0 0 0) 1)
(display "n-bit-addr '(1 1 0 0 1 0 1 0 1) '(1 0 1 1 0 0 0 1 1) 0): ")
(n-bit-addr '(1 1 0 0 1 0 1 0 1) '(1 0 1 1 0 0 0 1 1) 0)