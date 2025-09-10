# FFmpeg-Build

This repository provides scripts and a Docker container to **build a custom FFmpeg** with support for external libraries.

The main workflow includes building the container, compiling libraries, and generating the `ffmpeg` and `ffprobe` binaries ready for use.

---

## Repository Structure

- `build.sh` - Main script that creates the container, calls `generate.sh`, and outputs the binaries to the `artifacts/` directory.  
- `libs/` - Contains individual scripts for compiling each external library.  
- `artifacts/` - Output directory containing the compiled `ffmpeg` and `ffprobe` binaries.  

---

## Prerequisites

- Docker installed and running.  
- Linux x86_64 system (this build is intended for 64-bit Linux only).  

---

## Usage

To build FFmpeg, simply run:  
```bash
./build.sh