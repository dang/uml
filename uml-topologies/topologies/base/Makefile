# 
# This file is copyright 2006 by Daniel Gryniewicz.
# It is released under the GPL version 2
#

INSTPREFIX=$(TOPPREFIX)/base
INSTALL=install -c
SUBDIRS=conf.d default

all: $(SUBDIRS)
	@list='$(SUBDIRS)'; for p in $$list; do \
	  echo "Making $@ in $$p"; \
	  (cd $$p && TOPPREFIX=$(INSTPREFIX) $(MAKE) $@); \
	done

install: all
	@list='$(SUBDIRS)'; for p in $$list; do \
	  echo "Making $@ in $$p"; \
	  (cd $$p && TOPPREFIX=$(INSTPREFIX) $(MAKE) $@); \
	done

dist:
	@rm -rf .svn
	@list='$(SUBDIRS)'; for p in $$list; do \
	  echo "Making $@ in $$p"; \
	  (cd $$p && TOPPREFIX=$(INSTPREFIX) $(MAKE) $@); \
	done

clean:
	@list='$(SUBDIRS)'; for p in $$list; do \
	  echo "Making $@ in $$p"; \
	  (cd $$p && $(MAKE) $@); \
	done
