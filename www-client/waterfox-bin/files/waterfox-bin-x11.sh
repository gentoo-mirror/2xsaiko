#!/bin/sh

#
# Run Waterfox (bin) on X11
#
export MOZ_DISABLE_WAYLAND=1
exec @PREFIX@/bin/waterfox-bin "$@"
