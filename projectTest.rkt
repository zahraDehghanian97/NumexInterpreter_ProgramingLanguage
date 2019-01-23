#lang racket

(require "PLFinalProject.rkt")

; This file uses Racket's unit-testing framework, which is convenient but not required of you.

; Note we have provided [only] 3 tests, but you can't run them until do some of the assignment.
; You will want more tests.

(require rackunit)

(define tests
  (test-suite
   "Project Tests"

   (check-equal? (eval-exp (plus (num 2) (num 2))) (num 4) "plus simple test")

   (check-exn (lambda (x) (string=? (exn-message x) "NUMEX addition applied to non-number"))
              (lambda () (eval-exp (plus (num 2) (bool #t))))
              "plus bad argument")
   (check-equal? (eval-exp (plus (minus (mult (num 2)(num 3))(div (num -4)(num 4)))(neg (num 4))))(num 3))

   (check-equal? (numexlist->racketlist
                  (eval-exp (apply (apply numex-all-gt (num 9))
                                  (racketlist->numexlist 
                                   (list (num 10) (num 9) (num 15))))))
                 (list (num 10) (num 15))
                 "provided combined test using problems 1, 2, and 4")
   ))


(require rackunit/text-ui)
;; runs the test
(run-tests tests)