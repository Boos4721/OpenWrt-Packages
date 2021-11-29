# Cpolar-OpenWrt

[Cpolar](https://www.cpolar.com) is a secure intranet penetration tool. It can easily publish internal . websites to the public network, SSH remote home soft routing, remote desktop , to office PC, it can simulate the local development environment into a public network environment, convenient For WeChat public number, small programs, OpenAPI development and debugging. Is the development, geek, IT operations staff must be a weapon.

## Installing package

Download the [prebuild package](https://github.com/probezy/cpolar-openwrt/releases) and copy it onto your OpenWrt installation, preferably into the /tmp folder.

Then install the ipk package file:

```shell
opkg install cpolar_*.ipk
```

Now start Cpolar:

```shell
/etc/init.d/cpolar start
```

## Compiling from Sources

To include Cpolar into your OpenWrt image or to create
an .ipk package (equivalent to Debians .deb files),
you have to build an OpenWrt image.

To build OpenWrt on Debian, you need to install these packages:

```shell
sudo apt-get install subversion g++ zlib1g-dev build-essential git python
sudo apt-get install libncurses5-dev gawk gettext unzip file libssl-dev wget
```

Now prepare OpenWrt:

```shell
git clone https://github.com/openwrt/openwrt
cd openwrt

./scripts/feeds update -a
./scripts/feeds install -a
```

Now you can insert the cpolar package using a package feed or add the package manually.

### Add package by feed

A feed is the standard way packages are made available to the OpenWrt build system.

Put this line in your feeds list file (e.g. feeds.conf.default)

```shell
src-git cpolar https://github.com/probezy/cpolar-openwrt.git
```

Update and install the new feed

```shell
./scripts/feeds update cpolar
./scripts/feeds install cpolar
```

Now continue with the building packages section.

### Add package by hand

```shell
git clone https://github.com/probezy/cpolar-openwrt.git
cp -rf cpolar-openwrt/cpolar package/
rm -rf cpolar-openwrt/
```

Now continue with the building packages section.

### Building Packages

Configure packages:

```shell
make menuconfig
```

Now select the appropiate "Target System" and "Target Profile"
depending on what target chipset/router you want to build for.
Also mark the Cpolar package under Network ---> Network ---> <\*> cpolar.

Now compile/build everything:

```shell
make
```

The images and all \*.ipk packages are now inside the bin/ folder, including the zerotier package.
You can install the Cpolar .ipk on the target device using `opkg install <ipkg-file>`.

For details please check the OpenWrt documentation.

#### Build bulk packages

For a release, it is useful the build packages at a bulk for multiple targets:

```shell
#!/bin/sh

# dump-target-info.pl is used to get all targets configurations:
# https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=scripts/dump-target-info.pl

./scripts/dump-target-info.pl architectures | while read pkgarch target1 rest; do
  echo "CONFIG_TARGET_${target1%/*}=y" > .config
  echo "CONFIG_TARGET_${target1%/*}_${target1#*/}=y" >> .config
  echo "CONFIG_PACKAGE_example1=y" >> .config

  # Debug output
  echo "pkgarch: $pkgarch, target1: $target1"

  make defconfig
  make -j4 tools/install
  make -j4 toolchain/install

  # Build package
  make package/cpolar/{clean,compile}

  # Free space (optional)
  rm -rf build_dir/target-*
  rm -rf build_dir/toolchain-*
done
```
