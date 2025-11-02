#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# remove kde
dnf5 -y remove plasma-workspace plasma-* kde-* kcm-fcitx5

# setup niri
dnf5 -y install \
  niri \
  alacritty \
  gdm \
  xdg-desktop-portal-gtk \
  xdg-desktop-portal-gnome \
  gnome-keyring \
  nautilus \
  mako \
  fuzzel \
  waybar \
  swaylock \
  polkit-kde \
  swaybg \
  fcitx5-configtool fcitx5-rime \
  xwayland-satellite

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
systemctl --global add-wants niri.service mako.service
