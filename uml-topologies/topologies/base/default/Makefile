# 
# This file is copyright 2006 by Daniel Gryniewicz.
# It is released under the GPL version 2
#

INSTPREFIX=$(TOPPREFIX)/default
INSTALL=install
CPSYMLINK=cp -d
LN=ln -s
FILES= local netmount portmap sshd syslog-ng

all: $(FILES)

$(FILES):
	@$(LN) /etc/init.d/$@ $@

install: all
	$(INSTALL) -d $(INSTPREFIX)
	$(CPSYMLINK) $(FILES) $(INSTPREFIX)

dist:
	@rm -rf .svn

clean:
	@rm $(FILES)
