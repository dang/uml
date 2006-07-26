# 
# This file is copyright 2006 by Daniel Gryniewicz.
# It is released under the GPL version 2
#

PREFIX=$(TOPPREFIX)/conf.d
INSTALL=install
FILES= bootmisc clock consolefont crypto-loop domainname gpm hdparm hostname \
	hosts keymaps local.start local.stop net net.example nfs portmap rc \
	rsyncd snmpd snmptrapd sshd wireless.example

all: $(FILES)

install: all
	$(INSTALL) -d $(PREFIX)
	$(INSTALL) $(FILES) $(PREFIX)

dist:
	@rm -rf .svn

