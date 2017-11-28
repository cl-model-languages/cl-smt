
(defsystem cl-smt.z3
  :version "0.1"
  :author "Masataro Asai"
  :mailto "guicho2.71828@gmail.com"
  :license "LLGPL"
  :depends-on (:trivia :alexandria :iterate :cl-smt)
  :pathname "z3"
  :components ((:file "package"))
  :description "cl-smt implementation for z3 https://github.com/Z3Prover/z3/wiki"
  :in-order-to ((test-op (test-op :cl-smt.z3.test)))
  :defsystem-depends-on (:trivial-package-manager)
  :perform
  (load-op :before (op c)
            (uiop:symbol-call :trivial-package-manager
                              :ensure-program
                              "z3"
                              :apt "z3"
                              :dnf "z3"
                              :yum "z3"
                              :pacman "z3"
                              :yaourt "z3"
                              :brew "z3"
                              ;; :fink "z3"
                              ;; :macports "z3"
                              :choco "z3")))
