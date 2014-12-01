Box
===
# General

Box is a set of specific scripts that allows you to manages libvirt domains.

All the default parameters of each scripts can be set by editing the variables on the Configuration part.

===
# box_builder

Allow you to build a libvirt domain from a kickstart.

## Usage
```
usage: box_builder [-h] [-v] [-n NAME] [-p PATH] [-t TREE] [-ks KICKSTART]
                   [-f]

This script will help you to easily create a new domain with libvirt.

optional arguments:
  -h, --help            show this help message and exit
  -v, --verbose         Enable verbose output
  -n NAME, --name NAME  The name of your VM (default: puppetbox-rhel7)
  -p PATH, --path PATH  The path to create your VM (default:
                        /my/libvirt/images)
  -t TREE, --tree TREE  The path to the mounted iso (default:
                        http://192.168.1.1/rhel/rhel-server-7.0-x86-64/)
  -ks KICKSTART, --kickstart KICKSTART
                        The kickstart to install your VM (default:
                        http://192.168.1.1/libvirt/ks/base.ks)
  -f, --force           Erase the VM if exists (default: false)
```

## Examples



## How it works



## TODO
There is some issue that I need to correct or improve :
* Regroup the scripts in one with different actions
* Add an option on get_ip to avoid waiting everytime

===
# box_clone

Allow you to clone a libvirt domain from an existing libvirt domain.

## Usage
```
usage: box_clone [-h] [-v] [-o ORIGIN] [-c CLONE] [-p PATH] [-f]

This script will help you to easily create a clone VM.

optional arguments:
  -h, --help            show this help message and exit
  -v, --verbose         Enable verbose output
  -o ORIGIN, --origin ORIGIN
                        The name of your original VM (default: puppetbox-rhel7)
  -c CLONE, --clone CLONE
                        The name of your clone VM (default: puppetbox-clone)
  -p PATH, --path PATH  The path to create your clone VM (default:
                        /my/libvirt/images)
  -f, --force           Erase the clone VM if exists (default: false)
```

## Examples



## How it works



## TODO
There is some issue that I need to correct or improve :

===
# box_clean

Allow you to delete properly a libvirt domain.

## Usage
```
usage: box_clean [-h] [-v] [-p PATH] name

This script will help you to easily delete a libvirt domain.

positional arguments:
  name                  The name of your VM to delete

optional arguments:
  -h, --help            show this help message and exit
  -v, --verbose         Enable verbose output
  -p PATH, --path PATH  The path where the .img of your VM is stored (default:
                        /my/libvirt/images)
```

## Examples



## How it works



## TODO
There is some issue that I need to correct or improve :

===
# get_ip

Allow you to obtain the ip address of a running libvirt domain.

## Usage
```
usage: get_ip <box_name>
```

## Examples



## How it works



## TODO
* Add an option on get_ip to avoid waiting everytime
* Add help/usage
