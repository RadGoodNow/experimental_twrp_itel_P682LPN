# experimental_twrp_itel_P682LPN

 Blocking checks
- [x] Correct screen/recovery size
- [x] Working Touch, screen
- [x] Backup to internal/microSD
- [x] Restore from internal/microSD
- [x] reboot to system
- [x] ADB

Medium checks
- [x] update.zip sideload
- [x] UI colors (red/blue inversions)
- [x] Screen goes off and on
- [x] F2FS/EXT4 Support, exFAT/NTFS where supported
- [x] all important partitions listed in mount/backup lists
- [x] backup/restore to/from external (USB-OTG) storage
- [x] backup/restore to/from adb (https://gerrit.omnirom.org/#/c/15943/)
- [ ] Correct date
- [ ] decrypt /data
- [x] working /data (ONLY with modified vendor)
- [x] system partition in r/w (partially)
- [ ] mount vendor partition

Minor checks
- [ ] MTP export
- [x] reboot to bootloader
- [x] reboot to recovery
- [x] poweroff
- [x] battery level (partially)
- [x] temperature
- [x] encrypted backups
- [x] input devices via USB (USB-OTG) - keyboard, mouse and disks
- [x] USB mass storage export
- [x] set brightness
- [ ] vibrate
- [x] screenshot
- [x] partition SD card
