# 
# This file is copyright 2006 by Daniel Gryniewicz.
# It is released under the GPL version 2
#

INSTALL=install -c
SUBDIRS=uml-topologies uml-tools
RELEASE=0.3

all: $(SUBDIRS)
	@list='$(SUBDIRS)'; for p in $$list; do \
	  echo "Making all in $$p"; \
	  (cd $$p && $(MAKE) all); \
	done

install: all
	@list='$(SUBDIRS)'; for p in $$list; do \
	  echo "Making install in $$p"; \
	  (cd $$p && $(MAKE) install); \
	done

dist:
	@rm -rf .svn
	@list='$(SUBDIRS)'; for p in $$list; do \
	  echo "Making dist in $$p"; \
	  (cd $$p && $(MAKE) dist); \
	  mv $$p $$p-$(RELEASE); \
	  tar -cjf $$p-$(RELEASE).tar.bz2 $$p-$(RELEASE)/; \
	done

changelog:
	@svn2cl --break-before-msg --authors=authors.xml --group-by-day --separate-daylogs
	@svn2cl --break-before-msg --authors=authors.xml --group-by-day --separate-daylogs --html
	@list='$(SUBDIRS)'; for p in $$list; do \
	  echo "Making changelog in $$p"; \
	  (cd $$p && $(MAKE) changelog); \
	done
