
VERSION = 2.5.4

yices-$(VERSION)/bin/yices-smt2 :
	curl http://yices.csl.sri.com/releases/$(VERSION)/yices-$(VERSION)-x86_64-apple-darwin16.7.0-static-gmp.tar.gz | tar xz

