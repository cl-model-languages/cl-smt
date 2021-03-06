#|
  This file is a part of cl-smt project.
  Copyright (c) 2017 Masataro Asai (guicho2.71828@gmail.com)
|#

(in-package :cl-user)
(defpackage :cl-smt.test
  (:use :cl
        :cl-smt
        :fiveam
        :trivia :alexandria :iterate)
  (:export
   #:*smt-files*
   #:*solver*))
(in-package :cl-smt.test)

(def-suite :cl-smt.base)
(in-suite :cl-smt.base)

(defvar *smt-files*
  (directory (asdf:system-relative-pathname :cl-smt #p"smt/*.*")))

(defvar *solver* nil
  "solver keyword to test, e.g. :z3")

(test printer
  (is (equal "(set-option :produce-models true)
(set-logic QF_LIA)
(set-logic qf_lia)
bool
|Bool|"
             (with-output-to-string (s)
               (format-smt s
                 '((set-option :produce-models true)
                   (set-logic ^QF_LIA)
                   (set-logic QF_LIA)
                   Bool
                   |Bool|))))))

(def-suite :cl-smt.solve)
(in-suite :cl-smt.solve)

(named-readtables:in-readtable :fare-quasiquote)

(test solve
  (ematch (solve '((set-option :produce-models true)
                      (set-logic ^QF_LIA)
                      (declare-fun x () |Int|)
                      (declare-fun y () |Int|)
                      (declare-fun z () |Int|)
                      (assert (and (or
                                    (<= (+ x 3) (* 2 y))
                                    (>= (+ x 4) z))))
                      (check-sat)
                      (get-model))
                    *solver*
                    :debug t)
    (`(sat
       (model
        (define-fun ,v1 () int ,a1)
        (define-fun ,v2 () int ,a2)
        (define-fun ,v3 () int ,a3)))
      (progv (list v1 v2 v3) (mapcar #'eval (list a1 a2 a3))
        (is-true
         (and (or
               (<= (+ x 3) (* 2 y))
               (>= (+ x 4) z)))))))
  #+(or)
  (is (equal `(sat
               (model
                (define-fun u () int 0)
                (define-fun x () int 0)
                (define-fun z3name!3 () int 3)
                (define-fun z3name!4 () int 4)
                (define-fun y () int 0)
                (define-fun z () int 2)
                (define-fun v () int (- 5))))
             
             (solve `((set-option :produce-models true)
                      (set-logic ^QF_LIA)
                      (declare-fun x () |Int|)
                      (declare-fun y () |Int|)
                      (declare-fun z () |Int|)
                      (declare-fun u () |Int|)
                      (declare-fun v () |Int|)
                      (assert
                       (and (or (<= (+ x 3) (* 2 u))
                                (>= (+ v 4) y)
                                (>= (+ x y z) 2))
                            (= 7
                               (+ (ite (and (<= x 2) (<= 2 (+ x 3 (- 1)))) 3 0)
                                  (ite (and (<= u 2) (<= 2 (+ u 3 (- 1)))) 4 0)))))
                      (check-sat)
                      (get-model))
                    *solver*))))
               


  
