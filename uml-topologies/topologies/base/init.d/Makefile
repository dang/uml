# 
# This file is copyright 2006 by Daniel Gryniewicz.
# It is released under the GPL version 2
#

INSTPREFIX=$(TOPPREFIX)/init.d
INSTALL=install
CPSYMLINK=cp -d
LN=ln -s
FILES= bootmisc checkfs checkroot clock consolefont crypto-loop distccd \
	domainname gpm halt.sh hdparm hostname keymaps local localmount modules \
	netmount nscd ntp-client ntpd numlock portmap reboot.sh rmnologin rsyncd \
	shutdown.sh snmpd snmptrapd sshd syslog-ng urandom vixie-cron ypbind
LINKS= runscript.sh functions.sh depscan.sh

all: $(FILES) $(LINKS)

$(LINKS):
	@$(LN) /sbin/$@ $@

install: all
	$(INSTALL) -d $(INSTPREFIX)
	$(CPSYMLINK) $(FILES) $(INSTPREFIX)

dist:
	@rm -rf .svn

clean:
