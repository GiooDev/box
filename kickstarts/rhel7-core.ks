# Minimal RHEL 7.x kickstart file

# Required settings
lang en_US.UTF-8
keyboard fr-latin9
rootpw --iscrypted $1$apePe2Gb$4Q3cw8bH.jjR5bLsBbATA.
authconfig --enableshadow --enablemd5
#timezone UTC
timezone --utc Europe/Paris

# Optional settings
install
network --bootproto=dhcp
firewall --disabled
selinux --disabled
bootloader --location=mbr
text
skipx
zerombr
clearpart --all --initlabel
autopart
firstboot --disabled
reboot

%packages --excludedocs --nobase
@Core --nodefaults
-aic94xx-firmware*
-alsa-*
-iwl*firmware
%end

%post
%end
