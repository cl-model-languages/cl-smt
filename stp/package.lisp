#|
  This file is a part of cl-smt.stp project.
  Copyright (c) 2017 Masataro Asai (guicho2.71828@gmail.com)
|#

(in-package :cl-user)
(defpackage cl-smt.stp
  (:use :cl :trivia :alexandria :iterate :cl-smt))
(in-package :cl-smt.stp)

;; blah blah blah.

;; (defun stp ()
;;   (if (trivial-package-manager:which "stp")
;;       "stp"
;;       (asdf:system-relative-pathname :cl-smt.stp "stp-1.5/builds/bin/stp")))
;; 
;; (defmethod solve (input (solver-designator (eql :stp)) &key debug)
;;   (with-temp (d :directory t :debug debug)
;;     (with-temp (input-file :tmpdir d :template "XXXXXX.smt" :debug debug)
;;       (with-open-file (s input-file :direction :output :if-does-not-exist :error)
;;         (format-smt s input))
;;       (with-input-from-string (s (uiop:run-program `(,(stp) "--lang" "smt" ,input-file) :output :string))
;;         (iter (for elem in-stream s)
;;               (collecting elem))))))

;; note: is not available at the moment
