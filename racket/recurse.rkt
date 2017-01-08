; Macro to make writing tail-recursive functions easier.
; (c) Luiz de Milon, 2017
; This code is distributed under the ISC license.

#lang racket

(provide recurse)

(define-syntax recurse
   (syntax-rules ()
     ((recurse (<name> <arg> ...) (<default> ...)
               <body> ...)
      (letrec
        ((<name> (lambda (<arg> ...)
                   <body> ...)))
        (<name> <default> ...)))))

