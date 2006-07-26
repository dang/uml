# 
# This file is copyright 2006 by Daniel Gryniewicz.
# It is released under the GPL version 2
#

PREFIX=$(TOPPREFIX)/cluster
INSTALL=install
FILES=cluster.conf

all: $(FILES)

install: all
	$(INSTALL) -d $(PREFIX)
	$(INSTALL) $(FILES) $(PREFIX)

dist:
	@rm -rf .svn

