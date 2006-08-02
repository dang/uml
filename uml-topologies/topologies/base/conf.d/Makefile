# 
# This file is copyright 2006 by Daniel Gryniewicz.
# It is released under the GPL version 2
#

INSTPREFIX=$(TOPPREFIX)/conf.d
INSTALL=install
FILES= bootmisc clock consolefont crypto-loop gpm hdparm \
	keymaps local.stop net.example nfs portmap rc rsyncd snmpd snmptrapd \
	sshd wireless.example

all: $(FILES)

install: all
	$(INSTALL) -d $(INSTPREFIX)
	$(INSTALL) $(FILES) $(INSTPREFIX)

dist:
	@rm -rf .svn

clean:
