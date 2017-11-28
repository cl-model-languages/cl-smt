
(defsystem cl-smt.cvc3
  :version "0.1"
  :author "Masataro Asai"
  :mailto "guicho2.71828@gmail.com"
  :license "LLGPL"
  :depends-on (:trivia :alexandria :iterate :cl-smt)
  :components ((:file "package"))
  :description "cl-smt implementation for cvc3 https://cs.nyu.edu/acsys/cvc3/"
  :in-order-to ((test-op (test-op :cl-smt.cvc3.test)))
  :defsystem-depends-on (:trivial-package-manager)
  :perform
  (load-op :before (op c)
            (uiop:symbol-call :trivial-package-manager
                              :ensure-program
                              "cvc3"
                              :apt "cvc3"
                              :dnf "cvc3"
                              :yum "cvc3"
                              ;; :pacman "cvc3"
                              ;; :yaourt "cvc3"
                              ;; :brew "cvc3"
                              ;; :fink "cvc3"
                              :macports "cvc3"
                              ;; :choco "cvc3"

                              ;; removed this, since the original source code from
                              ;; https://cs.nyu.edu/acsys/cvc3/releases/2.4.1/cvc3-2.4.1.tar.gz
                              ;; does not build on the recent GCC compiler due to
                              ;; unsafe conversion from   const char*  to  char* 
                              ;; :from-source
                              )))
