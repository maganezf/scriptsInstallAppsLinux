#!/usr/bin/env bash

# -------------------------------------------------------------------------- #
sudo dnf update -y
sudo dnf upgrade -y

wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf install ./google-chrome-stable_current_x86_64.rpm


install_programs=(
  snapd
  firefox
  persepolis
  easytag
  thunar
  photoflare
  inkscape
  kdenlive
  flameshot
  xsensors
  cpu-x
  woesusb   #   https://github.com/slacka/WoeUSB/issues/311#issuecomment-624426060
  etcher #  https://github.com/balena-io/etcher#debian-and-ubuntu-based-package-repository-gnulinux-x86x64
  grub-customizer
  qbittorrent
  latte-dock
  gparted
  xsane
  htop
  neofetch
  kalarm
  onboard
  mesa-utils
  thunar
  pluma
)
# ---------------------------------------------------------------------- #

# ----------------------------- REQUISITOS ----------------------------- #

## Doc Fedora - https://docs.fedoraproject.org/en-US/quick-docs/

## Adicionando repositórios RPM - https://rpmfusion.org/Configuration

## java/jdk - https://www.oracle.com/java/technologies/javase-downloads.html


## Atualizando o repositório ##
sudo dnf update -y
sudo dnf upgrade -y

## Adicionando repositórios de terceiros e suporte a Snap e Lutris##
sudo dnf install snapd
sudo ln -s /var/lib/snapd/snap /snap
sudo dnf install fuse squashfuse
sudo dnf install kernel-modules
sudo dnf install lutris

# ---------------------------------------------------------------------- #
# ------------- Softwares que precisam de download externos ------------- #

## java/jdk - https://www.oracle.com/java/technologies/javase-downloads.html
## --  wps office (https://linux.wps.com/)



# ----------------------------- EXECUÇÃO ----------------------------- #
## Atualizando o repositório depois da adição de novos repositórios ##
sudo dnf update -y

# Instalar programas no dnf
for name_program in ${install_programs[@]}; do
  if ! dpkg -l | grep -q $name_program; then # Só instala se já não estiver instalado
    sudo dnf install "$name_program" -y
  else
    echo "[SUCCESSFUL INSTALLATION] - $name_program"
  fi
done

sudo dnf install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64 -y

# ---------------------------------------------------------------------- #

## Instalando pacotes Flatpak ##
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# ---------------------------------------------------------------------- #

    ## Instalando pacotes Snap ##

sudo snap install android-studio
sudo snap install beekeeper-studio
sudo snap install code
sudo snap install discord
sudo snap install figma-linux
sudo snap install guvcview
sudo snap install homeserver
sudo snap install insomnia
sudo snap install intellij-idea-community
sudo snap install kolourpaint
sudo snap install mailspring
sudo snap install meshlab
sudo snap install photogimp
sudo snap install spotify
sudo snap install telegram-desktop
sudo snap install todoist
sudo snap install vlc
sudo snap install whatsdesk

#   install WPS Office 2019 - Multi-Language SNAP   //      https://snapcraft.io/wps-2019-snap

sudo ln -s /var/lib/snapd/snap /snap
sudo snap install wps-2019-snap

sudo snap connect wps-2019-snap:cups-control :cups-control
sudo snap connect wps-2019-snap:alsa :alsa
sudo snap connect wps-2019-snap:pulseaudio :pulseaudio
sudo snap connect wps-2019-snap:removable-media :removable-media

# ---------------------------------------------------------------------- #

    ## Atualizando pacotes Snap ##
sudo snap refresh

# ---------------------------------------------------------------------- #

# Instalando Plugins de Audio

sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia

# ---------------------------------------------------------------------- #

# Instalar Wine         (https://wiki.winehq.org/Fedora)

sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/32/winehq.repo  #repositorio Fedora 32
sudo dnf install winehq-stable


# -------------------------------------------------------------------------- #
# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #

## Finalização, atualização e limpeza##
sudo dnf update && sudo dnf upgrade --refresh &&
flatpak update
sudo dnf clean all

# -------------------------------------------------------------------------- #
