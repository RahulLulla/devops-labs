# basic_docker

This folder contains a minimal Dockerfile that builds a tiny image based on Alpine Linux and prints a message when run.

Dockerfile summary

- Base image: `alpine:latest`
- Default command: `CMD ["echo", "Hello, Captain!"]`

Prerequisites

- Docker installed and running (Docker Desktop on Windows is recommended).
- A working shell (PowerShell is used in the examples below).

How to build

Open PowerShell in this folder (where the `Dockerfile` exists) and run:

```powershell
docker build -t basic-alpine-hello .
```

How to run

Run the image with:

```powershell
docker run --rm basic-alpine-hello
```

You should see:

```
Hello, Captain!
```

Notes

- To run an interactive shell inside the Alpine image for exploration, use:

```powershell
docker run --rm -it alpine sh
```

Project URL:
https://roadmap.sh/projects/basic-dockerfile