#|
  This file is a part of cl-smt project.
  Copyright (c) 2017 Masataro Asai (guicho2.71828@gmail.com)
|#


(in-package :cl-user)
(defpackage cl-smt.test-asd
  (:use :cl :asdf))
(in-package :cl-smt.test-asd)


(defsystem cl-smt.test
  :author "Masataro Asai"
  :mailto "guicho2.71828@gmail.com"
  :description "Test system of cl-smt"
  :license "LLGPL"
  :depends-on (:cl-smt
               :fiveam)
  :components ((:module "t"
                :components
                ((:file "package"))))
  :perform (test-op :after (op c) (eval
 (read-from-string
  "(5am:run! :cl-smt)"))
))
