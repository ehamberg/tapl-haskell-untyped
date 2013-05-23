.PHONY: test run clean veryclean

UNTYPED=cabal-dev/bin/untyped
UNTYPEDTEST=cabal-dev/bin/untyped-test

SRCFILES  := $(wildcard src/*.hs)
TESTFILES := $(wildcard test/*.hs)

$(UNTYPED): $(SRCFILES)
	cabal-dev -j4 install

run: test.λ
	$(UNTYPED) test.λ

run-tests: $(UNTYPED) $(TESTFILES) test.out test.λ
	$(UNTYPED)-test

clean:
	rm -f $(UNTYPED) $(UNTYPED)-test

veryclean:
	rm -rf cabal-dev
