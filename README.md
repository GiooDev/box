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
usage: box_builder [-h]
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
usage: box_clone [-h]
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
usage: box_clean [-h]
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
There is some issue that I need to correct or improve :
* Add an option on get_ip to avoid waiting everytime
