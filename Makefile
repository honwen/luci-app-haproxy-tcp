#
# Copyright (C) 2016-2023 honwen https://github.com/honwen
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-haproxy-tcp
PKG_VERSION:=0.4.0
PKG_RELEASE:=3

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=honwen <https://github.com/honwen>

TITLE:=LuCI Support for HAProxy-TCP
LUCI_DEPENDS:=+haproxy-nossl
LUCI_PKGARCH:=all

define Package/$(PKG_NAME)/conffiles
/etc/config/haproxy-tcp
endef

include $(TOPDIR)/feeds/luci/luci.mk

define Package/$(PKG_NAME)/postinst
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
	if [ -f /etc/uci-defaults/luci-haproxy-tcp ]; then
		( . /etc/uci-defaults/luci-haproxy-tcp ) && \
		rm -f /etc/uci-defaults/luci-haproxy-tcp
	fi
	rm -rf /tmp/luci-indexcache /tmp/luci-modulecache
fi
exit 0
endef

# call BuildPackage - OpenWrt buildroot signature
