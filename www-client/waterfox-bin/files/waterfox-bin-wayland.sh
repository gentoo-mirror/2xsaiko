#!/bin/sh

#
# Run Waterfox (bin) on Wayland
#
export MOZ_ENABLE_WAYLAND=1
exec @PREFIX@/bin/waterfox-bin "$@"
