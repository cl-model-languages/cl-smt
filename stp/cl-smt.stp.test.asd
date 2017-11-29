#|
  This file is a part of cl-smt.stp project.
  Copyright (c) 2017 Masataro Asai (guicho2.71828@gmail.com)
|#

(defsystem cl-smt.stp.test
  :author "Masataro Asai"
  :mailto "guicho2.71828@gmail.com"
  :description "Test system of cl-smt.stp"
  :license "LLGPL"
  :depends-on (:cl-smt.stp
               :cl-smt.test)
  :perform (test-op :after (op c)
                    (eval (read-from-string "(let ((cl-smt.test:*solver* :stp)) (5am:run! :cl-smt.solve))"))))
