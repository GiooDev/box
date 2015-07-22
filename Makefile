rpmdir		:= $(shell rpm --eval="%_rpmdir")
srcrpmdir	:= $(shell rpm --eval="%_srcrpmdir")

# TODO: specify your spec file here
specfile=box.spec

# TODO: Here, you list all the files and directories you want to include
# with your release. When a directory is specified, all its content is
# taken into account recursively.
files=$(specfile) box get_ip boxconfig.ini kickstarts

name=$(shell awk '/^Name/ {print $$NF}' $(specfile))
version=$(shell awk '/^Version/ {print $$NF}' $(specfile))
raw_release=$(shell awk '/^Release/ {print $$NF}' $(specfile))
srelease=$(shell rpm --define='dist %{nil}' --eval=$(raw_release))
release=$(shell rpm --eval=$(raw_release))
arch=$(shell awk '/^BuildArch/ {print $$NF}' $(specfile))
pkg_dir= $(name)-$(version)
tarall= $(pkg_dir).tar.gz
spackage_name=$(pkg_dir)-$(srelease)
package_name=$(pkg_dir)-$(release)
srpm= $(srcrpmdir)/$(spackage_name).src.rpm
rpm= $(rpmdir)/$(arch)/$(package_name).$(arch).rpm

# Default target: erase only produced files.
clean:
	rm -f *~ archives/$(tarall) archives/$(shell basename $(rpm)) archives/$(shell basename $(srpm)) 
	rm -rf /tmp/$(USER)/$(pkg_dir)/*

# Use this target to get information gathered by this Makefile.
# 'make config'
config: 
	@echo "name:		$(name)"
	@echo "version:		$(version)"
	@echo "release:		$(release)"
	@echo "pkg_dir:		$(pkg_dir)"
	@echo "tarall:		$(tarall)"
	@echo "srpm:		$(srpm)"
	@echo "rpm:		$(rpm)"
	@echo "INFO: config OK"
	@echo "tarall: $(tarall)"

# Copy required source files to a temporary directory. This directory
# will be tarred. The tar file will then be used by the rpmbuild
# command.
copy: config
	mkdir -p archives
	mkdir -p /tmp/$(USER)
	@mkdir -pv /tmp/$(USER)/$(pkg_dir)
	rsync -aC $(files) /tmp/$(USER)/$(pkg_dir)

tar: 
	tar --exclude .git -C /tmp/$(USER) --owner=root --group=root -cvzf archives/$(tarall) $(pkg_dir)
	@echo "INFO: tar OK"

generate_rpm:
	@rpmbuild -v -ts --define='dist %{nil}' archives/$(tarall)
	@echo "INFO: rpmbuild -v -ts --define='dist %{nil}' archives/$(tarall) OK"
	@cp $(srpm) archives
	@echo "####################################################"
	@echo "INFO: Source rpm successfully created in archives!!!"
	@echo "####################################################"
	@echo "TARALL: $(tarall)"
	@rpmbuild -v -tb archives/$(tarall)
	@echo "INFO: rpmbuild -v -tb archives/$(tarall) OK"
	@cp $(rpm) archives
	@echo "####################################################"
	@echo "INFO: Binary rpm successfully created in archives!!!"
	@echo "####################################################"

rpm: copy tar generate_rpm
