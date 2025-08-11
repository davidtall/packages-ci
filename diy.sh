#!/bin/bash

git clone https://github.com/QiuSimons/luci-app-daed tmp
cd tmp && mv {daed,luci-app-daed} ../
cd .. && rm -rf tmp
sed -i 's/PKG_MIRROR_HASH:=skip/PKG_MIRROR_HASH:=/g' daed/Makefile

#git clone https://github.com/davidtall/OpenWRT-CI tmp
#cd tmp && mv package/* ../
#cd .. && rm -rf tmp
