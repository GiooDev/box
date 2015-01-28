Name:		box
Version:	1.0
Release:	1%{?dist}
BuildArch: 	noarch
Summary:	Allow you to easily manage libvirt domains.

Group:		Applications/System
License:	GPL v2
URL:		https://github.com/GiooDev/box
Source0:	%{name}-%{version}.tar.gz

Requires:	libvirt virt-install qemu seabios libguestfs-tools

%description


%prep
%setup -q


%build


%install
rm -rf $RPM_BUILD_ROOT
install -m 755 -D box $RPM_BUILD_ROOT/usr/sbin/box
install -m 644 -D boxconfig.ini $RPM_BUILD_ROOT/etc/box/boxconfig.ini


%files
%defattr(-,root,root,-)
   /usr/sbin/box
   /etc/box/boxconfig.ini
%doc


%changelog

