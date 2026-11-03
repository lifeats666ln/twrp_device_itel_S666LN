#
# Copyright (C) 2026 The AERA Recovery Project
#
# SPDX-License-Identifier: GPL-3.0-or-later
#

FDEVICE="S666LN"

aera_get_target_device() {
	local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
	if [ -n "$chkdev" ]; then
		AERA_BUILD_DEVICE="$FDEVICE"
	else
		chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
		[ -n "$chkdev" ] && AERA_BUILD_DEVICE="$FDEVICE"
	fi
}

if [ -z "$1" -a -z "$AERA_BUILD_DEVICE" ]; then
	aera_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$AERA_BUILD_DEVICE" = "$FDEVICE" ]; then
	export LC_ALL="C"

	# Partition layout; AERA_A16.sh reads these from the environment
	export AERA_AB_DEVICE=1
	export AERA_VIRTUAL_AB_DEVICE=1
	export AERA_VENDOR_BOOT_RECOVERY=1

	# Build identity
	export AERA_VANILLA_BUILD=1
	export AERA_PRODUCT_PREFIX=AERA
	export AERA_BUILD_STATUS=Unofficial
	export AERA_BUILD_TYPE=Beta
	unset AERA_MAINTAINER_PATCH_VERSION

	# Settings
	export AERA_ALLOW_EARLY_SETTINGS_LOAD=1
	export AERA_SETTINGS_ROOT_DIRECTORY=/data/recovery
	export AERA_MISCELLANEOUS_ROOT_DIRECTORY=/sdcard

	# Bundled tools
	export AERA_USE_TAR_BINARY=1
	export AERA_USE_SED_BINARY=1
	export AERA_USE_LZ4_BINARY=1
	export AERA_USE_ZSTD_BINARY=1
	export AERA_USE_DATE_BINARY=1
	export AERA_USE_GREP_BINARY=1
	export AERA_USE_BUSYBOX_BINARY=1
	export AERA_USE_XZ_UTILS=1
	export AERA_USE_NANO_EDITOR=1
	export AERA_USE_UPDATED_MAGISKBOOT=1
fi
