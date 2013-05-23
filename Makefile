.PHONY: test run

UNTYPED=cabal-dev/bin/untyped

SRCFILES  := $(wildcard src/*.hs)
TESTFILES := $(wildcard test/*.hs)

$(UNTYPED): $(SRCFILES)
	cabal-dev -j4 install

run: test.f
	$(UNTYPED) test.f

run-tests: $(UNTYPED) $(TESTFILES) test.out test.f
	$(UNTYPED)-test
