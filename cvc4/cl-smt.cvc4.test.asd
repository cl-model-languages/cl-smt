#|
  This file is a part of cl-smt.cvc4 project.
  Copyright (c) 2017 Masataro Asai (guicho2.71828@gmail.com)
|#

(defsystem cl-smt.cvc4.test
  :author "Masataro Asai"
  :mailto "guicho2.71828@gmail.com"
  :description "Test system of cl-smt.cvc4"
  :license "LLGPL"
  :depends-on (:cl-smt.cvc4
               :cl-smt.test)
  :perform (test-op :after (op c)
                    (eval (read-from-string "(let ((cl-smt.test:*solver* :cvc4)) (5am:run! :cl-smt.solve))"))))
