
(defsystem cl-smt.cvc4
  :version "0.1"
  :author "Masataro Asai"
  :mailto "guicho2.71828@gmail.com"
  :license "LLGPL"
  :depends-on (:trivia :alexandria :iterate :cl-smt)
  :components ((:file "package"))
  :description "cl-smt implementation for cvc4 http://cvc4.cs.stanford.edu/web/"
  :in-order-to ((test-op (test-op :cl-smt.cvc4.test)))
  :defsystem-depends-on (:trivial-package-manager)
  :perform
  (load-op :before (op c)
            (uiop:symbol-call :trivial-package-manager
                              :ensure-program
                              "cvc4"
                              :apt "cvc4" ;debian, and ubuntu >= bionic
                              :dnf "cvc4"
                              :yum "cvc4"
                              :pacman "cvc4"
                              :yaourt "cvc4"
                              :brew "CVC4/cvc4/cvc4"
                              ;; :fink "cvc4"
                              :macports "cvc4"
                              ;; :choco "cvc4"
                              :env-alist `(("PATH" . ,(format nil "~a:~a"
                                                              (asdf:system-relative-pathname
                                                               :cl-smt.cvc4 "cvc4-1.5/builds/bin/")
                                                              (uiop:getenv "PATH"))))
                              :from-source (format nil "make -C ~a" (asdf:system-source-directory :cl-smt.cvc4)))))
