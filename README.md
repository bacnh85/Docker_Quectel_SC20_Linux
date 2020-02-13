# Introduction

How to build SC20 Linux under Docker environment. Tested in MacOS Mojave 10.14.6

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

### Build SC20 Image

Inside docker container, you can build SC20 Linux, just follow the Quectel getting started manual.

```
$ cd sc20_linux
$ cd poky
$ source build/conf/set_bb_env.sh
$ build-8909-quec-smart-image
```