#|
  This file is a part of cl-smt.cvc3 project.
  Copyright (c) 2017 Masataro Asai (guicho2.71828@gmail.com)
|#

(defsystem cl-smt.cvc3.test
  :author "Masataro Asai"
  :mailto "guicho2.71828@gmail.com"
  :description "Test system of cl-smt.cvc3"
  :license "LLGPL"
  :depends-on (:cl-smt.cvc3
               :cl-smt.test)
  :perform (test-op :after (op c)
                    (eval (read-from-string "(let ((cl-smt.test:*solver* :cvc3)) (5am:run! :cl-smt.solve))"))))
