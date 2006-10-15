# 
# This file is copyright 2006 by Daniel Gryniewicz.
# It is released under the GPL version 2
#

INSTPREFIX=$(TOPPREFIX)/4-box
INSTALL=install
FILES=4-box.conf

all: $(FILES)

install: all
	$(INSTALL) -d $(INSTPREFIX)
	$(INSTALL) $(FILES) $(INSTPREFIX)

dist:
	@rm -rf .svn

clean:
