# 
# This file is copyright 2006 by Daniel Gryniewicz.
# It is released under the GPL version 2
#

PREFIX=/usr/bin
INSTALL=install
FILES=uml-build uml-build-stop uml-functions.sh uml-start uml-sync uml-test

all: $(FILES)
	@list='$(FILES)'; for p in $$list; do \
	  sed -i 's#@PREFIX@#$(PREFIX)#' $$p; \
	done

install: all
	$(INSTALL) -d $(PREFIX)
	$(INSTALL) $(FILES) $(PREFIX)

dist:
	@rm -rf .svn

changelog: ChangeLog
	@svn2cl --break-before-msg --authors=authors.xml --group-by-day --separate-daylogs
