; Macro to make writing tail-recursive functions easier.
; (c) Luiz de Milon, 2017
; This code is distributed under the ISC license.

#lang racket

(require racket/trace)

(provide recurse
         trace-recurse)

(define-syntax recurse
   (syntax-rules ()
     ((recurse (<name> <arg> ...) (<default> ...)
               <body> ...)
      (letrec
        ((<name> (lambda (<arg> ...)
                   <body> ...)))
        (<name> <default> ...)))))

(define-syntax trace-recurse
   (syntax-rules ()
     ((recurse (<name> <arg> ...) (<default> ...)
               <body> ...)
      (letrec
        ((<name> (trace-lambda (<arg> ...)
                   <body> ...)))
        (<name> <default> ...)))))
