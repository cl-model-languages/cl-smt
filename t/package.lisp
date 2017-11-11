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


(defvar *smt-files*
  (directory (asdf:system-relative-pathname :cl-smt #p"t/smt/*.*")))
