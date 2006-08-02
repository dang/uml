# 
# This file is copyright 2006 by Daniel Gryniewicz.
# It is released under the GPL version 2
#

PREFIX=/opt/uml-topologies
INSTALL=install -c
SUBDIRS=topologies
CHANGELOGS=ChangeLog

all: $(SUBDIRS)
	@list='$(SUBDIRS)'; for p in $$list; do \
	  echo "Making all in $$p"; \
	  (cd $$p && TOPPREFIX=$(PREFIX) $(MAKE) all); \
	done

install: all
	@list='$(SUBDIRS)'; for p in $$list; do \
	  echo "Making install in $$p"; \
	  (cd $$p && TOPPREFIX=$(PREFIX) $(MAKE) install); \
	done

dist: $(CHANGELOGS)
	@rm -rf .svn
	@list='$(SUBDIRS)'; for p in $$list; do \
	  echo "Making dist in $$p"; \
	  (cd $$p && TOPPREFIX=$(PREFIX) $(MAKE) dist); \
	done

$(CHANGELOGS):
	@svn2cl --break-before-msg --authors=../authors.xml --group-by-day --separate-daylogs

clean:
	@list='$(SUBDIRS)'; for p in $$list; do \
	  echo "Making $@ in $$p"; \
	  (cd $$p && $(MAKE) $@); \
	done
	@rm -rf $(CHANGELOGS)
