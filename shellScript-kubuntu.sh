#!/usr/bin/env bash

# -------------------------------------------------------------------------- #

sudo apt update -y
sudo apt upgrade -y

## Adicionando/Confirmando arquitetura de 32 bits ##
sudo dpkg --add-architecture i386


# baixar vivaldi // https://vivaldi.com/download/

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
  woesusb           #   https://github.com/slacka/WoeUSB/issues/311#issuecomment-624426060
  etcher            #   https://github.com/balena-io/etcher#debian-and-ubuntu-based-package-repository-gnulinux-x86x64
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

## Atualizando o repositório ##
sudo apt update -y

## Adicionando repositórios de terceiros e suporte a Snap e Lutris##
sudo apt update -y
sudo apt install snapd
sudo apt install lutris

# ----------------------------------------------------------------------- #
# ------------- Softwares que precisam de download externos ------------- #

## java/jdk - https://www.oracle.com/java/technologies/javase-downloads.html
## HOW TO INSTALL JDK KUBUNTU 20.04 = https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-20-04

## --  wps office (https://linux.wps.com/)
  # traducao wps = https://github.com/HenriqueAD7/wps-osistematico-language-pt-br && 
  # https://github.com/HenriqueAD7/wps-osistematico-templates


# ----------------------------- EXECUÇÃO ----------------------------- #
    ## Atualizando o repositório depois da adição de novos repositórios ##
sudo apt update -y

    # Instalar programas no apt
for name_program in ${install_programs[@]}; do
  if ! dpkg -l | grep -q $name_program; then # Só instala se já não estiver instalado
    sudo apt install "$name_program" -y
  else
    echo "[SUCCESSFUL INSTALLATION] - $name_program"
  fi
done

# ---------------------------------------------------------------------- #

    ## Instalando Wine ##

sudo apt install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64 -y


# ---------------------------------------------------------------------- #

    ## Instalando pacotes Flatpak ##
sudo add-apt-repository ppa:alexlarsson/flatpak
sudo apt update -y
sudo apt install flatpak -y
sudo apt install plasma-discover-flatpak-backend
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

#sudo apt install ubuntu-restricted-extras

sudo apt install kubuntu-restricted-extras

# ---------------------------------------------------------------------- #

    # Instalar Wine         (https://wiki.winehq.org/Ubuntu)

sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
sudo apt install --install-recommends winehq-stable
sudo apt update


# -------------------------------------------------------------------------- #
# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #

    ## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y
sudo apt install gnome-keyring

# -------------------------------------------------------------------------- #
