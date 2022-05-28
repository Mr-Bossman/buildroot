################################################################################
#
# esp-hosted-ng
#
################################################################################

ESP_HOSTED_NG_VERSION = 2482b4bba47aae6ab18b941350e7b6fc496059be
ESP_HOSTED_NG_SITE = $(call github,Mr-Bossman,esp-hosted,$(ESP_HOSTED_NG_VERSION))
ESP_HOSTED_NG_DEPENDENCIES = linux
ESP_HOSTED_NG_LICENSE = GPL-2.0
ESP_HOSTED_NG_LICENSE_FILE = LICENSE
ESP_HOSTED_NG_MODULE_SUBDIRS = esp_hosted_ng/host

define ESP_HOSTED_NG_LINUX_CONFIG_FIXUPS
	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
	$(call KCONFIG_ENABLE_OPT,CONFIG_MAC80211)
	$(call KCONFIG_ENABLE_OPT,CONFIG_BT)
endef

$(eval $(kernel-module))
$(eval $(generic-package))
