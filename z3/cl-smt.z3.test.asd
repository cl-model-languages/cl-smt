#|
  This file is a part of cl-smt.z3 project.
  Copyright (c) 2017 Masataro Asai (guicho2.71828@gmail.com)
|#

(defsystem cl-smt.z3.test
  :author "Masataro Asai"
  :mailto "guicho2.71828@gmail.com"
  :description "Test system of cl-smt.z3"
  :license "LLGPL"
  :depends-on (:cl-smt.z3
               :cl-smt.test)
  :perform (test-op :after (op c)
                    (eval (read-from-string "(let ((cl-smt.test:*solver* :z3)) (5am:run! :cl-smt.solve))"))))
