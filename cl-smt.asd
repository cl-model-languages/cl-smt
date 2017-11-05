
(in-package :cl-user)
(defpackage cl-smt-asd
  (:use :cl :asdf))
(in-package :cl-smt-asd)


(defsystem cl-smt
  :version "0.1"
  :author "Masataro Asai"
  :mailto "guicho2.71828@gmail.com"
  :license "LLGPL"
  :depends-on (:trivia :alexandria :iterate)
  :pathname "src"
  :components ((:file "package"))
  :description "Common Interface to SMT (Satisfiable Module Theories) solvers from Common Lisp"
  :in-order-to ((test-op (test-op :cl-smt.test))))
