#|
  This file is a part of cl-smt project.
  Copyright (c) 2017 Masataro Asai (guicho2.71828@gmail.com)
|#

(in-package :cl-user)
(defpackage cl-smt
  (:use :cl :trivia :alexandria :iterate)
  (:export
   #:with-temp
   #:solve
   #:format-smt))
(in-package :cl-smt)

;; blah blah blah.

(defmacro with-temp ((var &key directory template (tmpdir "/tmp/") debug) &body body)
  "Create a temporary file, then remove the file by unwind-protect.
Most arguments are analogous to mktemp.
When DIRECTORY is non-nil, creates a directory instead.
When DEBUG is non-nil, it does not remove the directory so that you can investigate what happened inside the directory."
  (with-gensyms (command)
    `(let ((,var (uiop:run-program
                  (let ((,command (format nil "mktemp --tmpdir='~a' ~@[-d~*~] ~@[~a~]"
                                          ,tmpdir ,directory ,template)))
                    (if ,debug
                        (print ,command)
                        ,command))
                  :output '(:string :stripped t))))
       (unwind-protect
            (progn ,@body)
         (if ,debug
             (format t "~&not removing ~a for debugging" ,var)
             (uiop:run-program (format nil "rm -rf ~a" (namestring ,var)) :ignore-error-status t))))))


(defgeneric solve (input solver-designator &key debug)
  (:documentation "INPUT is a list of S-expressions which defines the SMT solver input[1].
They are treated as a single file.
solver-designator is a keyword that specifies the solver.
ARGS is an optional list of arguments that are passed to the solver, which is implementation-dependent.

[1] http://smtlib.cs.uiowa.edu/papers/smt-lib-reference-v2.6-r2017-07-18.pdf"))

(defun format-smt (s forms)
  "Print a smt program to a stream.
Although it may sound intuitive, this is not; For example,

* NIL should be written as () instead
* Package prefix is not allowed while keywords should be printed with a colon, so princ is NG
* Type checking (only numbers, symbols, lists)
* Dotted list is not allowed.
* Incompatible assumptions in the readtable case between SMT-LIB and Common Lisp.

We achieve the versatile output by NOT making any assumptions to the readtable case, nor the print case.

Normal, non-mixed case symbols are printed in downcase, because most keywords in SMT are defined in downcase.
Mixed case symbols are printed in vertical bars, as usual.

However, certain symbols need to be printed in ALL UPCASE.
We mark such symbols by prepending a caret ^ character, i.e. ^QF_LIA .

All symbols except keywords are printed without package prefixes, including uninterned symbols.
"
  (let ((*print-case* :downcase))
    (format s "~{~/cl-smt::format-form/~^~%~}" forms)))

(eval-when (:compile-toplevel)
  (setf *arity-check-by-test-call* nil))

(defun format-form (s form colon at)
  (declare (ignorable colon at))
  (ematch form
    ((type cons)
     ;; dotted list is not allowed.
     (format s "(~{~/cl-smt::format-form/~^ ~})" form))
    ((type (or number keyword string))
     (prin1 form s))
    (nil
     (write-string "()" s))
    ((symbol :name (and name (string* #\^)))
     (write-string (subseq name 1) s))
    ((type symbol)
     ;; usually preserves the case
     (prin1 form s))))

#+(or)
(dolist (*print-case*  (list :upcase :downcase :capitalize))
  (dolist (fn (list #'princ #'prin1))
    (print (list *print-case* fn)) (terpri)
    (funcall fn :keyword) (terpri)
    (funcall fn '|aAaAa|) (terpri)
    (funcall fn 'symbol) (terpri)))

#+(or)
(format-smt *standard-output*
            '((set-option :produce-models true)
              (set-logic ^QF_LIA)
              (set-logic QF_LIA)
              Bool
              |Bool|))

