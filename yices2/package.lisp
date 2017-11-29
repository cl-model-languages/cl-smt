#|
  This file is a part of cl-smt.yices2 project.
  Copyright (c) 2017 Masataro Asai (guicho2.71828@gmail.com)
|#

(in-package :cl-user)
(defpackage cl-smt.yices2
  (:use :cl :trivia :alexandria :iterate :cl-smt))
(in-package :cl-smt.yices2)

;; blah blah blah.

;; (defun yices2 ()
;;   (if (trivial-package-manager:which "yices2")
;;       "yices2"
;;       (asdf:system-relative-pathname :cl-smt.yices2 "yices2-1.5/builds/bin/yices2")))
;; 
;; (defmethod solve (input (solver-designator (eql :yices2)) &key debug)
;;   (with-temp (d :directory t :debug debug)
;;     (with-temp (input-file :tmpdir d :template "XXXXXX.smt" :debug debug)
;;       (with-open-file (s input-file :direction :output :if-does-not-exist :error)
;;         (format-smt s input))
;;       (with-input-from-string (s (uiop:run-program `(,(yices2) "--lang" "smt" ,input-file) :output :string))
;;         (iter (for elem in-stream s)
;;               (collecting elem))))))

;; note: is not available at the moment
