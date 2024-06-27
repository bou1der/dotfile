#!/bin/sh

export LIBVA_DRIVER_NAME=nvidia
export XDG_SESSION_TYPE=wayland
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export WAYLAND_DEBUG=0
export WLR_RENDERER_ALLOW_SOFTWARE=1

exec Hyprland
