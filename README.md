

# NOTE THESE ARE (UBUNTU BASED) UNSUPPORTED ARM64 VERSIONS OF THE UNIFIED STREAMING COMMAND LINE TOOLS, AIMED TO RUN ON APPLE SILICON / ARM64 BASED SYSTEMS


# Unified Streaming command line tools for systems based on ARM64 architecture 

This repository is used to build Docker images for each of the Unified Streaming command line
tools for use on systems based on arm64 architecture, such as the latest Macbook Pro M1 systems
Please not that for usage you will need a valid Unified Streaming license key (please see www.unified-streaming.com)

## How it works

Dockerfiles to build each command line tool are in the `docker/<tool>`
directories, 
All tools images are based on the `mp4split` image.  Because we need to force te usage arm64 architecture, we need to build every image separately instead of using the mp4split  base image from Docker Hub
Most of the tools just change the `entrypoint.sh` script and default command, but `manifest_edit` has to install Python and the Manifest
Edit packages as well.


## Shell functions

The following shell functions can be used to run specific versions of each tool
as though they were installed. 

Note: they mount the current working directory to `/data` in the container and
use that as the working directory.

The functions can be included in your bash, zsh, etc. profile as required.

Note: The version of mp4split used is being set in the dockerfile(s) with the 'VERSION' build argument.
By default the beta repository of Unified streaming for ubuntu / arm64 is being used.

## Installation

To install the tools, e.g. on a Macbook Pro M1, first build the images.
For convenience a SH script 'build-images-for-arm64.sh' is provided.
Detailed instructions below.

Ckeck out this Git repository :

```bash
git clone  https://github.com/marcelpoelstra/cli-tools-arm64.git
```

and cd in to the directory :

```bash
cd cli-tools-arm64
```

Add the execute permission to the script :

```bash
chmod + build-images-for-arm64.sh
```

and run the script :

```bash
./build-images-for-arm64.sh
```
After successful completion of the script, please add the following example in your local .bashrc or .zshrc "

```bash

# docker helper functions Unified Streaming (local arm64 versions)

export UspLicenseKey=<YOUR_USP_LICENSE_KEY>

mp4split() {
  IMAGE=mp4split-arm64
  docker run --rm -it -e UspLicenseKey -v ${PWD}:/data --workdir /data $IMAGE "$@"
}

cpix_verify() {
  BASE_IMAGE=cpix_verify-arm64
  docker run --rm -it -e UspLicenseKey -v ${PWD}:/data --workdir /data $IMAGE "$@"
}

manifest_edit() {
  IMAGE=manifest_edit-arm64
  docker run --rm -it -e UspLicenseKey -v ${PWD}:/data --workdir /data $IMAGE "$@"
}

push_input_stream() {
  IMAGE=push_input_stream-arm64
  docker run --rm -it -e UspLicenseKey -v ${PWD}:/data --workdir /data $IMAGE "$@"
}

unified_capture() {
  IMAGE=unified_capture-arm64
  docker run --rm -it -e UspLicenseKey -v ${PWD}:/data --workdir /data $IMAGE "$@"
}

unified_remix() {
  IMAGE=unified_remix-arm64
  docker run --rm -it -e UspLicenseKey -v ${PWD}:/data --workdir /data $IMAGE "$@"
}
```