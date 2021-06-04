#!/usr/bin/env bash

export VITASDK=/usr/local/vitasdk
export PATH=$VITASDK/bin:$PATH

cd /vagrant

. build.conf
TITLE_ID="${HOMEBREW_ID}00001"

echo "Building VPK for homebrew $HOMEBREW_NAME"
echo "Using $EBOOT_TYPE eboot and TITLE_ID $HOMEBREW_ID"

rm -f ./build/eboot.bin

if [[ $EBOOT_TYPE == "unsafe" ]]
then
  cp ./eboot/eboot_unsafe.bin ./build/eboot.bin
else
  cp ./eboot/eboot_safe.bin ./build/eboot.bin
fi

vita-mksfoex -s TITLE_ID=$TITLE_ID "$HOMEBREW_NAME" ./build/sce_sys/param.sfo

7z a -tzip "$HOMEBREW_NAME.vpk" -r ./build/* ./build/eboot.bin

echo "Done building VPK."
