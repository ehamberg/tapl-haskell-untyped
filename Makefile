.PHONY: test run clean veryclean

UNTYPED=cabal-dev/bin/untyped
UNTYPEDTEST=cabal-dev/bin/untyped-test

SRCFILES  := $(wildcard src/*.hs)
TESTFILES := $(wildcard test/*.hs)

$(UNTYPED): $(SRCFILES)
	cabal-dev -j4 install

$(UNTYPEDTEST): $(TESTFILES)
	cabal-dev -j4 install

run: $(UNTYPED) test.λ
	$(UNTYPED) test.λ

run-tests: $(UNTYPED) $(UNTYPEDTEST)
	$(UNTYPEDTEST)

clean:
	rm -f $(UNTYPED) $(UNTYPEDTEST)

veryclean:
	rm -rf cabal-dev
