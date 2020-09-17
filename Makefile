ZIP := awscli-exe-linux-x86_64.zip
URL := https://awscli.amazonaws.com/$(ZIP)
TMPDIR := $(shell mktemp -d awscli-temp-XXXXXXXX)
BINDIR := $(HOME)/bin
INSTALLDIR := $(HOME)/.local/lib/aws-cli
CURL := /usr/bin/curl
UNZIP := /usr/bin/unzip

.PHONY: usage install update uninstall clean download unzip
.SILENT: usage

usage:
	@echo "make install: installs the AWS CLI in $(INSTALLDIR), links in $(BINDIR)"
	@echo "make update: updates an existing installation"
	@echo "make uninstall: uninstalls an existing installation"
	@echo "make clean: clean up"
	-rm -rf $(TMPDIR)

install: $(TMPDIR)/aws
	mkdir -p $(BINDIR) $(INSTALLDIR)
	$(TMPDIR)/aws/install --bin-dir $(BINDIR) --install-dir $(INSTALLDIR)
	-rm -rf $(TMPDIR)

update: $(TMPDIR)/aws
	$(TMPDIR)/aws/install --bin-dir $(BINDIR) --install-dir $(INSTALLDIR) --update
	-rm -rf $(TMPDIR)

uninstall:
	-rm $(BINDIR)/aws
	-rm $(BINDIR)/aws_completer
	-rm -rf $(INSTALLDIR)
	rmdir $(TMPDIR)

$(TMPDIR)/$(ZIP): $(CURL)
	$(CURL) "$(URL)" -o $(TMPDIR)/$(ZIP)

$(TMPDIR)/aws: $(TMPDIR)/$(ZIP) $(UNZIP)
	$(UNZIP) -d $(TMPDIR) $(TMPDIR)/$(ZIP)

clean:
	-rm -rf awscli-temp-*
