# 
# This file is copyright 2006 by Daniel Gryniewicz.
# It is released under the GPL version 2
#

INSTALL=install -c
SUBDIRS=uml-topologies uml-tools
CHANGELOGS=ChangeLog ChangeLog.html
RELEASE=0.6

all: $(SUBDIRS)
	@list='$(SUBDIRS)'; for p in $$list; do \
	  echo "Making $@ in $$p"; \
	  (cd $$p && $(MAKE) $@); \
	done

install: all
	@list='$(SUBDIRS)'; for p in $$list; do \
	  echo "Making $@ in $$p"; \
	  (cd $$p && $(MAKE) $@); \
	done

dist: $(CHANGELOGS)
	@rm -rf .svn
	@list='$(SUBDIRS)'; for p in $$list; do \
	  echo "Making $@ in $$p"; \
	  (cd $$p && $(MAKE) $@); \
	  mv $$p $$p-$(RELEASE); \
	  tar -cjf $$p-$(RELEASE).tar.bz2 $$p-$(RELEASE)/; \
	done

$(CHANGELOGS):
	@svn2cl --break-before-msg --authors=authors.xml --group-by-day --separate-daylogs
	@svn2cl --break-before-msg --authors=authors.xml --group-by-day --separate-daylogs --html

clean:
	@list='$(SUBDIRS)'; for p in $$list; do \
	  echo "Making $@ in $$p"; \
	  (cd $$p && $(MAKE) $@); \
	done
	@rm -rf $(CHANGELOGS)
