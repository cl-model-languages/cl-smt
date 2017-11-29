
(defsystem cl-smt.yices2
  :version "0.1"
  :author "Masataro Asai"
  :mailto "guicho2.71828@gmail.com"
  :license "LLGPL"
  :depends-on (:trivia :alexandria :iterate :cl-smt)
  :components ((:file "package"))
  :description "cl-smt implementation for yices2 http://yices.csl.sri.com/"
  :in-order-to ((test-op (test-op :cl-smt.yices2.test)))
  :defsystem-depends-on (:trivial-package-manager)
  :perform
  (load-op :before (op c)
            (uiop:symbol-call :trivial-package-manager
                              :ensure-program
                              "yices-smt2"
                              :apt "sri-csl/formal-methods/yices2" ; for <= xenial only
                              :dnf "yices2"
                              :yum "yices2"
                              ;; :pacman "yices2"
                              ;; :yaourt "yices2"
                              :brew "yices2"
                              ;; :fink "yices2"
                              :macports "yices2"
                              ;; :choco "yices2"
                              ;; just downloading the linux binary
                              :env-alist `(("PATH" . ,(format nil "~a:~a"
                                                              (asdf:system-relative-pathname
                                                               :cl-smt.yices2 "yices-2.5.4/bin/")
                                                              (uiop:getenv "PATH"))))
                              :from-source (format nil "make -C ~a -f ~a"
                                                   (asdf:system-source-directory :cl-smt.yices2)
                                                   (asdf:system-relative-pathname
                                                    :cl-smt.yices2
                                                    #+linux "linux.mk"
                                                    #+darwin "darwin.mk"
                                                    #+(and x86-64 windows) "win64.mk"
                                                    #+(and (not x86-64) windows) "win32.mk")))))
