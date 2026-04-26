#!/bin/bash

git clone https://github.com/QiuSimons/luci-app-daed tmp
pushd tmp
  mv {daed,luci-app-daed} ../
popd

sed -i 's/PKG_MIRROR_HASH:=skip/PKG_MIRROR_HASH:=/g' daed/Makefile
sed -i 's/pnpm install ; \\/pnpm install --no-frozen-lockfile ; \\/g' daed/Makefile
sed -i 's|/run/i\\  procd_set_param|/procd_set_param command/i \\\tprocd_set_param|g' luci-app-daed/root/etc/init.d/luci_daed

rm -rf tmp && git clone https://github.com/davidtall/OpenWRT-CI tmp
pushd tmp
  mv package/* ../
popd
rm -rf tmp
