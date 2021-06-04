#!/usr/bin/env bash

export VITASDK=/usr/local/vitasdk
export PATH=$VITASDK/bin:$PATH

sudo mkdir /build
sudo chmod -R 777 /build
cd /build

echo "Installing dependencies..."
sudo apt-get update
sudo apt-get install -y sudo wget curl make git-core xz-utils python apt-transport-https ca-certificates gnupg software-properties-common wget p7zip-full

echo "Installing Latest CMake Version..."
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | sudo apt-key add -
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'

sudo apt-get update
sudo apt-get install -y cmake

git clone https://github.com/vitasdk/vdpm
cd vdpm
sudo -E ./bootstrap-vitasdk.sh
sudo -E ./install-all.sh

sudo apt-get install -qq -y pkg-config
sudo apt-get install -qq -y libc6-dev-i386

cd /build

git clone https://github.com/hyln9/vita-libdl
cd vita-libdl
make
sudo -E make install

cd /build

git clone https://github.com/hyln9/vita-luajit
cd vita-luajit/src
make HOST_CC="gcc -m32" CROSS=arm-vita-eabi- TARGET_SYS=PSP2 TARGET_FLAGS="-marm -fno-optimize-sibling-calls" PREFIX="ux0:/data/luajit"hi
sudo -E cp libluajit.a $VITASDK/arm-vita-eabi/lib/libluajit.a
sudo -E cp lua.h $VITASDK/arm-vita-eabi/include/lua.h
sudo -E cp lualib.h $VITASDK/arm-vita-eabi/include/lualib.h
sudo -E cp lauxlib.h $VITASDK/arm-vita-eabi/include/lauxlib.h
sudo -E cp luaconf.h $VITASDK/arm-vita-eabi/include/luaconf.h
sudo -E cp lua.hpp $VITASDK/arm-vita-eabi/include/lua.hpp
sudo -E cp luajit.h $VITASDK/arm-vita-eabi/include/luajit.h

cd /build

git clone https://github.com/xerpi/libvita2d
sudo -E cp libvita2d/libvita2d/include/utils.h $VITASDK/arm-vita-eabi/include/utils.h

git clone https://github.com/Rinnegatamante/lpp-vita
cd lpp-vita

make clean
make -j$(nproc)

mkdir /vagrant/eboot/
cp eboot_safe.bin /vagrant/eboot/
cp eboot_unsafe.bin /vagrant/eboot/

cd /vagrant
