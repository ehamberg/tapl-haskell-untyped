.PHONY: test run clean veryclean

UNTYPED=cabal-dev/bin/untyped

SRCFILES  := $(wildcard src/*.hs)
TESTFILES := $(wildcard test/*.hs)

$(UNTYPED): $(SRCFILES)
	cabal-dev -j4 install

run: test.f
	$(UNTYPED) test.f

run-tests: $(UNTYPED) $(TESTFILES) test.out test.f
	$(UNTYPED)-test

clean:
	rm -f $(UNTYPED) $(UNTYPED)-test

veryclean:
	rm -rf cabal-dev
