include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-mqos
PKG_RELEASE:=1
PKG_MAINTAINER:=WROIATE <https://github.com/WROIATE>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-mqos
		SECTION:=luci
		CATEGORY:=LuCI
		SUBMENU:=3. Applications
		TITLE:=Qos by MAC Address
		PKGARCH:=all
		DEPENDS:=+luci-base +tc +kmod-sched-core +kmod-ifb
endef

define Package/luci-app-ustb/description
This package contains LuCI configuration pages for MQos.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-mqos/install
		$(INSTALL_DIR) $(1)/etc/config
		$(INSTALL_DIR) $(1)/etc/init.d
		$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/mqos
		$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
		$(INSTALL_DIR) $(1)/etc/uci-defaults
		$(INSTALL_DIR) $(1)/etc/hotplug.d/iface

		$(INSTALL_CONF) ./root/etc/uci-defaults/* $(1)/etc/uci-defaults
		$(INSTALL_CONF) ./root/etc/config/mqos $(1)/etc/config/mqos
		$(INSTALL_BIN) ./root/etc/init.d/mqos $(1)/etc/init.d/mqos
		$(INSTALL_DATA) ./root/etc/hotplug.d/iface/10-mqos $(1)/etc/hotplug.d/iface/10-ustb
		
		$(INSTALL_DATA) ./luasrc/model/cbi/mqos.lua $(1)/usr/lib/lua/luci/model/cbi/mqos/mqos.lua
		$(INSTALL_DATA) ./luasrc/controller/mqos.lua $(1)/usr/lib/lua/luci/controller/mqos.lua
endef


$(eval $(call BuildPackage,$(PKG_NAME)))
