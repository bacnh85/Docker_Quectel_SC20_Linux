# Introduction

How to build SC20 Linux under Docker environment.

## Gettting started

Clone this repo:

```
$ git clone https://github.com/ngohaibac/Quectel_SC20_Linux_Build
$ cd Quectel_SC20_Linux_Build
$ sh script/bootstrap
$ sh start.sh 
```
Then clone the sc20_linux:

```
$ git clone ssh://git@gitlab.quectel.com:2222/quectel_smart/sc20_linux.git
```
## Change build configuration

Due to MacOS hard link issue, the build will be failed, thus modified local.conf should be considered to replaced sc20_linux/poky/build/conf/local.conf

Change location: TMPDIR = "/opt/build/tmp", SSTATE_DIR ?= "/opt/build/sstate-cache"

The build result will be located inside docker volume at /opt/build/ 

### Build SC20 Image

Inside docker container, you can build SC20 Linux, just follow the Quectel getting started manual.

```
$ cd sc20_linux
$ cd poky
$ source build/conf/set_bb_env.sh
$ build-8909-quec-smart-image
```