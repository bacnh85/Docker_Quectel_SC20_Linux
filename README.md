# Introduction

How to build SC20 Linux under Docker environment. Tested in macOS Catalina 10.15.3

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

*Note*: In order to obtain SC20 Linux SDK, pls help to coordinate with your local FAE and sales in your region.

### Build SC20 Image

#### Mac Users

SC20 Linux folders are organized as below:

```
bacnh@17e4be739562:/opt$ tree -L 1
.
├── build                 <-- Volume mount folder
├── deploy                <-- Output of build process
├── docker-compose.yml    
├── Dockerfile
├── docs                  <--- Documents
├── images                <--- All images for SC20 modules, ...
├── README.md
├── script
├── SDK                   <-- SC20_Linux SDK
└── start.sh
```

For Mac users, there could be many errors due to different file system, ... , volume mount is still the best approach:
- Configure the build to store build data into volume mount
- Sync output data into build folder

1) Modify the local.conf

Copy modified local.conf from scripts folder to SDK/poky/build/conf/local.conf folder and adjust BB_NUMBER_THREADS, PARALLEL_MAKE based on your PC's configuration.

```
$ cp script/local.conf SDK/poky/build/conf/local.conf
```

What I have done:

a) Change SSTATE_DIR and TMPDIR to build folder

- SSTATE_DIR ?= "/opt/build/sstate-cache"
- TMPDIR = "/opt/build/tmp"


2) Build the image

Inside docker container, you can build SC20 Linux, just follow the Quectel getting started manual.

```
$ cd SDK/poky
$ source build/conf/set_bb_env.sh
$ build-8909-quec-smart-image
```

Output of the build is inside /opt/build folder.

3) Sync the result

Inside the docker, run the sync script to sync data from build folder to deploy folder.

*Note*: You are runnign below command inside the docker container

```
$ cd /opt
$ sh sh script/sync.sh
```

Content inside deploy folder look like this:

```
bacnh@17e4be739562:/opt$ tree deploy -L 1
deploy
├── images
├── ipk
└── licenses
```

### Linux user

Pls go straight forward to build your SC20 Linux follow the Quectel documents.

```
$ cd SDK/poky
$ source build/conf/set_bb_env.sh
$ build-8909-quec-smart-image
```

*Note*: The Mac method also can be applied to Linux users to take advantage of volume mount in Docker container.