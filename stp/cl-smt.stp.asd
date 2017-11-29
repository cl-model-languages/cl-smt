
(defsystem cl-smt.stp
  :version "0.1"
  :author "Masataro Asai"
  :mailto "guicho2.71828@gmail.com"
  :license "LLGPL"
  :depends-on (:trivia :alexandria :iterate :cl-smt)
  :components ((:file "package"))
  :description "cl-smt implementation for stp http://stp.github.io/"
  :in-order-to ((test-op (test-op :cl-smt.stp.test)))
  :defsystem-depends-on (:trivial-package-manager)
  :perform
  (load-op :before (op c)
            (uiop:symbol-call :trivial-package-manager
                              :ensure-program
                              "stp"
                              ;; :apt "stp"
                              :dnf "stp"
                              :yum "stp"
                              ;; :pacman "stp"
                              ;; :yaourt "stp"
                              ;; :brew "STP/stp/stp"
                              ;; :fink "stp"
                              :macports "stp"
                              ;; :choco "stp"
                              ;; from-source seems complicated
                              ;; :env-alist `(("PATH" . ,(format nil "~a:~a"
                              ;;                                 (asdf:system-relative-pathname
                              ;;                                  :cl-smt.stp "stp-1.5/builds/bin/")
                              ;;                                 (uiop:getenv "PATH"))))
                              ;; :from-source (format nil "make -C ~a" (asdf:system-source-directory :cl-smt.stp))
                              )))
