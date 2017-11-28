#|
  This file is a part of cl-smt.z3 project.
  Copyright (c) 2017 Masataro Asai (guicho2.71828@gmail.com)
|#

(in-package :cl-user)
(defpackage cl-smt.z3
  (:use :cl :trivia :alexandria :iterate :cl-smt))
(in-package :cl-smt.z3)

;; blah blah blah.

(defmethod solve (input (solver-designator (eql :z3)) &key debug)
  (with-temp (d :directory t :debug debug)
    (with-temp (input-file :tmpdir d :template "XXXXXX.smt" :debug debug)
      (with-open-file (s input-file :direction :output :if-does-not-exist :error)
        (format-smt s input))
      (with-input-from-string (s (uiop:run-program `("z3" "-smt2" ,input-file) :output :string))
        (iter (for elem in-stream s)
              (collecting elem))))))


