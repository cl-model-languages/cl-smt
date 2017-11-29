
VERSION = 2.5.4

yices-$(VERSION)/bin/yices_smt2 : yices-$(VERSION)
	cd $< ; ./configure ; $(MAKE)
	cd $< ; ln -s build/*/bin bin

yices-$(VERSION) :
	curl http://yices.csl.sri.com/releases/$(VERSION)/yices-$(VERSION)-src.tar.gz | tar xz



