################################################################################
#
# esp-hosted-ng
#
################################################################################

ESP_HOSTED_NG_VERSION = cb48e5d318f53c8ed42a16e6f2d753a86f8906c5
ESP_HOSTED_NG_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_NG_VERSION))
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

ifeq ($(BR2_PACKAGE_ESP_HOSTED_NG_SPI),y)
ESP_HOSTED_NG_MODULE_MAKE_OPTS = target=spi
else
ESP_HOSTED_NG_MODULE_MAKE_OPTS = target=sdio
endif

$(eval $(kernel-module))
$(eval $(generic-package))
