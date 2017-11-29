#|
  This file is a part of cl-smt.yices2 project.
  Copyright (c) 2017 Masataro Asai (guicho2.71828@gmail.com)
|#

(defsystem cl-smt.yices2.test
  :author "Masataro Asai"
  :mailto "guicho2.71828@gmail.com"
  :description "Test system of cl-smt.yices2"
  :license "LLGPL"
  :depends-on (:cl-smt.yices2
               :cl-smt.test)
  :perform (test-op :after (op c)
                    (eval (read-from-string "(let ((cl-smt.test:*solver* :yices2)) (5am:run! :cl-smt.solve))"))))
