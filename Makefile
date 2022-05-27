# -*- Makefile -*-
SHELL = /bin/sh
EMACS ?= emacs
RM = @rm -rf
EMACS_BATCH_OPTS= --batch -Q -L .

.PHONY: test clean compile

clean:
	$(RM) *~
	$(RM) \#*\#
	$(RM) *.elc


compile: clean
	$(RM) *.elc
	@$(EMACS) $(EMACS_BATCH_OPTS) -l tests/my-byte-compile.el 2>&1 | grep -E "([Ee]rror|[Ww]arning):" && exit 1 || exit 0

test: compile
	@$(EMACS) $(EMACS_BATCH_OPTS) -l tests/shenshou-tests.el
