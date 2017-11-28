#|
  This file is a part of cl-smt.cvc4 project.
  Copyright (c) 2017 Masataro Asai (guicho2.71828@gmail.com)
|#

(in-package :cl-user)
(defpackage cl-smt.cvc4
  (:use :cl :trivia :alexandria :iterate :cl-smt))
(in-package :cl-smt.cvc4)

;; blah blah blah.

(defun cvc4 ()
  (if (trivial-package-manager:which "cvc4")
      "cvc4"
      (asdf:system-relative-pathname :cl-smt.cvc4 "cvc4-1.5/builds/bin/cvc4")))

(defmethod solve (input (solver-designator (eql :cvc4)) &key debug)
  (with-temp (d :directory t :debug debug)
    (with-temp (input-file :tmpdir d :template "XXXXXX.smt" :debug debug)
      (with-open-file (s input-file :direction :output :if-does-not-exist :error)
        (format-smt s input))
      (with-input-from-string (s (uiop:run-program `(,(cvc4) "--lang" "smt" ,input-file) :output :string))
        (iter (for elem in-stream s)
              (collecting elem))))))

;; note: cvc4 produces non-conforming output. Does not work
;;       implementing the latest cvc4 is more important
