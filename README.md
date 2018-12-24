My dot files,
include from respective files

* ~/.bash_profile
* ~/.tmux.conf
* ~/.vimrc


and so forthl

# Arch

# install
```
loadkeys us #this is the default, don't have to do anything
timedatectl set-ntp true
cfdisk #graphical format tool
mkfs.ext4 /dev/sda1 #make sure this is really sda1 lol
#swap drives are skipped, won't need it with our ram
mount /dev/sda1 /mnt
pacstrap /mnt base #on fast internet, this took about 2mins
genfstab -U /mnt >> /mnt/etc/fstab
#CHROOT!!!!
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Europe/Zurich /etc/localtime
hwclock --systohc
#uncomment locale
rm /etc/locale.gen
locale-gen
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
#set locale
echo "LANG=en_US.UTF-8" > /etc/locale.conf
#hostname file
create file /etc/hostname with hostname in it
# hosts file
echo "127.0.0.1 localhost" > /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
#install grub bootloader for MBR(for UEFI, it'll be different)
pacman -Sy grub
grub-install --target=i386-pc /dev/sda
#This will prolly be different if not MBR method
grub-mkconfig -o /boot/grub/grub.cfg

#reboot!
sudo poweroff 
#once rebooted (remove install medium!)
useradd -m bamertn # has many more options for groups
passwd bamertn
dhcpcd enp0s3 #start dhcpd on network interface
pacman -Sy sudo
visudo #Go edit the User Privilege specification
exit
#login as bamertn
#setup dhcpd
sudo systemctl start dhcpcd
sudo systemctl enable dhcpcd
sudo pacman -Sy networkmanager
sudo systemctl enable NetworkManager
#install basic packages
sudo pacman -Sy gcc git cmake r python tmux vim 
#install X,i3wm, dmenu, fonts, terminal emulator
sudo pacman -Sy xorg-xinit xorg-server i3-gaps i3status dmenu
sudo pacman -Sy ttf-inconsolata ttf-linux-libertine
sudo pacman -Sy rxvt-unicode
echo "exec i3" > ~/.xinitrc
#setup i3, urxvt (.Xresources) configs
```
When doing the arch setup, use the following:
## System setup

- i3wm window manager
- status bar for i3wm : polybar
- File browser nnn / ranger 
- music player mpd / ncmpcpp 
- video player: vlc
- terminal urxvt
- do everything: dmenu

## Software
- vim, tmux + their configs
- R
- texlive-full
- firefox


