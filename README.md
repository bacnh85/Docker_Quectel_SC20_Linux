# Introduction

How to build SC20 Linux under Docker environment. Tested in MacOS Mojave 10.14.6

## Gettting started

Clone this repo:

```
$ git clone https://github.com/ngohaibac/Quectel_SC20_Linux_Build
$ cd Quectel_SC20_Linux_Build
$ sh script/bootstrap
# sh script/macos_setup_nfs.sh
$ sh start.sh 
```
Then clone the sc20_linux:

```
$ git clone ssh://git@gitlab.quectel.com:2222/quectel_smart/sc20_linux.git
```
## Change build configuration

Due to MacOS hard link issue, the build will be failed, thus new approach is:
- Mount /opt as bind mount
- Mount /opt/build as NFS mount
- Change poky/conf/local.conf, TMPDIR, SSTATE_DIR to /opt/build. You can also change DL_DIR to /opt/build/downloads, so you can keep the download files outside of sc20_linux

### Build SC20 Image

Inside docker container, you can build SC20 Linux, just follow the Quectel getting started manual.

```
$ cd sc20_linux
$ cd poky
$ source build/conf/set_bb_env.sh
$ build-8909-quec-smart-image
```