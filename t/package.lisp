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
   #:*smt-files*))
(in-package :cl-smt.test)

(def-suite :cl-smt)
(in-suite :cl-smt)

(defvar *smt-files*
  (directory (asdf:system-relative-pathname :cl-smt #p"smt/*.*")))

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
