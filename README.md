# xeus-cling Binaries

Weekly builds of https://github.com/jupyter-xeus/xeus-cling.

![hydrun CI](https://github.com/pojntfx/xeus-cling-binaries/workflows/hydrun%20CI/badge.svg)

## Installation

Binaries packages (`.tar.gz`, built against the GNU `libc`) are built weekly and uploaded to [GitHub releases](https://github.com/pojntfx/xeus-cling-binaries/releases).

You can install them like so:

```shell
# Fetch the xeus-cling binary package for your architecture (x86_64 and aarch64 are supported)
curl -L -o /tmp/xeus-cling.tar.gz https://github.com/pojntfx/xeus-cling-binaries/releases/download/latest/xeus-cling.$(uname -m).tar.gz

# Extract the package to /usr/local/xeus-cling. You must install in this prefix.
XEUS_PREFIX=/usr/local/xeus-cling
sudo mkdir -p ${XEUS_PREFIX}
sudo tar -C ${XEUS_PREFIX} -xzf /tmp/xeus-cling.tar.gz

# Install the kernels
sudo jupyter kernelspec install ${XEUS_PREFIX}/share/jupyter/kernels/xcpp11 --sys-prefix
sudo jupyter kernelspec install ${XEUS_PREFIX}/share/jupyter/kernels/xcpp14 --sys-prefix
sudo jupyter kernelspec install ${XEUS_PREFIX}/share/jupyter/kernels/xcpp17 --sys-prefix
```

## License

xeus-cling Binaries (c) 2021 Felicitas Pojtinger and contributors

SPDX-License-Identifier: BSD-3-Clause
