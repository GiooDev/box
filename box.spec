%define box_path /etc/box
%define ks_path %{box_path}/kickstarts
Name:		box
Version:	1.0
Release:	2%{?dist}
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
install -m 755 -D get_ip $RPM_BUILD_ROOT%{box_path}/get_ip
install -m 644 -D boxconfig.ini $RPM_BUILD_ROOT%{box_path}/boxconfig.ini
install -m 644 -D kickstarts/rhel7-core.ks $RPM_BUILD_ROOT%{ks_path}/rhel7-core.ks


%files
%defattr(-,root,root,-)
   /usr/sbin/box
   %{box_path}/get_ip
   %{ks_path}/rhel7-core.ks
%config(noreplace)
   %{box_path}/boxconfig.ini
%doc


%changelog
* Tue Jul 21 2015 Julien Georges <julien.georges@atos.net> 1.0-2
  - Now working with local kickstart and delivering kickstart minimal for rhel7
