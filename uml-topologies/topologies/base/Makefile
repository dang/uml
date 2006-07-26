# 
# This file is copyright 2006 by Daniel Gryniewicz.
# It is released under the GPL version 2
#

INSTPREFIX=$(TOPPREFIX)/base
INSTALL=install -c
SUBDIRS=conf.d

all: $(SUBDIRS)
	@list='$(SUBDIRS)'; for p in $$list; do \
	  echo "Making all in $$p"; \
	  (cd $$p && TOPPREFIX=$(INSTPREFIX) $(MAKE) all); \
	done

install: all
	@list='$(SUBDIRS)'; for p in $$list; do \
	  echo "Making install in $$p"; \
	  (cd $$p && TOPPREFIX=$(INSTPREFIX) $(MAKE) install); \
	done

dist:
	@rm -rf .svn
	@list='$(SUBDIRS)'; for p in $$list; do \
	  echo "Making dist in $$p"; \
	  (cd $$p && TOPPREFIX=$(INSTPREFIX) $(MAKE) dist); \
	done
