### childhood

- [obtain NixOS minimal ISO image](https://nixos.org/download), validate SHA-256 using sha256sum
- copy image onto a USB stick (e.g, using [Ventoy](https://www.ventoy.net/en/index.html))
  - obtain Ventoy from [AUR](https://aur.archlinux.org/ventoy-bin.git)
  - `ventoy /dev/sdb` (paste here your USB drive)
  - `mount /dev/sdb1 /mnt`
  - `cp image.iso /mnt`
- enter NixOS (e.g, via UEFI boot manager)

### boyhood
- pcspkr is not loaded by default (few understand)
- `setfont ter-132n`
- `sudo -i`
- set up wpa_supplicant
  - `systemctl start wpa_supplicant`
  - `wpa_cli`
    - underlying method works only for home networks, for enterprise networks [read an official guide](https://nixos.org/manual/nixos/stable/#sec-installation-manual-networking)
    - `add_network`
    - `set_network 0 ssid "myhomenetwork"`
    - `set_network 0 psk "mypassword"`
    - `set_network 0 key_mgmt WPA-PSK`
    - `enable_network 0`
    - wait for "Connection to ... completed"
    - `quit`
  - `ping google.com`
- partitioning (on UEFI): create boot (1G), swap (8G) and root partitions (e.g, using cfdisk)
- formatting: `mkfs.fat -F32 /dev/sda1`, `mkfs.ext4 /dev/sda2`, `mkswap /dev/sda3`
- mounting: `mount /dev/sda2 /mnt`, `mkdir /mnt/boot`, `mount /dev/sda1 /mnt/boot`, `swapon /dev/sda3`
- generate hardware config: `nixos-generate-config --root /mnt`
- curl configuration.nix
- `nixos-install`
- `reboot`

### youth
- `passwd user`
