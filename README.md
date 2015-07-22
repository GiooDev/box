Box
===
# General

Box is a set of specific scripts that allows you to manages libvirt domains.

===
# Configuration
box will search the following locations for a configuration file :
* {current working directory}/boxconfig.ini
* ~/.box/boxconfig.ini
* /etc/box/boxconfig.ini

You can set all the default parameters for each functions.
```
[global]
box_name = mybox-ori
box_path = /data/libvirt/images

[install]
tree = http://192.168.1.1/box/isos/rhel7.1/
kickstart = /etc/box/kickstarts/rhel7-core.ks

[clone]
clone_name = mybox-clone
```
These default values allows you to start all the functions without the need 
to put manually the needed parameters.

===
# Functions
## box

One main command to rule them all !

### Usage
```
usage: box [-h] [-v] {install,clone,clean,ip} ...

This script will help you to easily create a new domain with libvirt.

optional arguments:
  -h, --help            show this help message and exit
  -v, --verbose         Enable verbose output

sub-commands:
  {install,clone,clean,ip}
    install             Install a libvirt box from a kickstart.
    clone               Clone a libvirt domain.
    clean               Delete a libvirt domain.
    ip                  Get the ip of a libvirt domain.
```

===
## box install

Allow you to build a libvirt domain from a kickstart.

### Usage
```
usage: box install [-h] [-v] [-n NAME] [-p PATH] [-t TREE] [-ks KICKSTART]
                   [-f] [-c]

optional arguments:
  -h, --help            show this help message and exit
  -v, --verbose         Enable verbose output
  -n NAME, --name NAME  The name of your VM (default: mybox-ori)
  -p PATH, --path PATH  The path to create your VM (default:
                        /data/libvirt/images)
  -t TREE, --tree TREE  The path to the mounted iso (default:
                        http://192.168.1.1/box/isos/rhel7.1/)
  -ks KICKSTART, --kickstart KICKSTART
                        The kickstart to install your VM (default:
                        /etc/box/kickstarts/rhel7-core.ks)
  -f, --force           Erase the VM if exists (default: false)
  -c, --console         Enable console output during installation.
```

### Examples
`box install -n newbox -p /my/images/ -ks /etc/box/kickstarts/minimal.ks`

===
## box clone

Allow you to clone a libvirt domain from an existing libvirt domain.

### Usage
```
usage: box clone [-h] [-v] [-n NAME] [-c CLONE] [-p PATH] [-f]

optional arguments:
  -h, --help            show this help message and exit
  -v, --verbose         Enable verbose output
  -n NAME, --name NAME  The name of your VM (default: mybox-ori)
  -c CLONE, --clone CLONE
                        The name of your clone VM (default: mybox-clone)
  -p PATH, --path PATH  The path to create your VM (default:
                        /data/libvirt/images)
  -f, --force           Erase the VM if exists (default: false)
```

### Examples
`box clone`

===
## box clean

Allow you to delete properly a libvirt domain.

### Usage
```
usage: box clean [-h] [-v] [-p PATH] name

positional arguments:
  name                  The name of your VM to delete

optional arguments:
  -h, --help            show this help message and exit
  -v, --verbose         Enable verbose output
  -p PATH, --path PATH  The path to create your VM (default:
                        /data/libvirt/images)
```

### Examples
`box clean`

===
## box ip

Allow you to obtain the ip address of a running libvirt domain.

### Usage
```
usage: box ip [-h] [-v] [-w SEC] name
```

### Examples
`box ip mybox-ori`


===
# TODO
* Add an option on get_ip to avoid waiting everytime
* Add 'all' parameter to get_ip function to obtain the ipaddress of all domains

===
# Known issues
```
error: failed to connect to the hypervisor
error: Failed to connect socket to '/var/run/libvirt/libvirt-sock': No such file or directory
```
You need to start libvirtd: `systemctl start libvirtd.service`


```
ERROR    Error with storage parameters: No read access to directory '/data/libvirt/images'
```
Just create the missing directory for the storage of your images.
