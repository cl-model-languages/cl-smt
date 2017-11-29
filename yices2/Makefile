
VERSION = cvc4-1.5

$(VERSION)/builds/bin/cvc4 : $(VERSION)
	cd $(VERSION); ./configure ; $(MAKE)

$(VERSION):
	curl http://cvc4.cs.stanford.edu/downloads/builds/src/$(VERSION).tar.gz | tar xz
