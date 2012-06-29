#!/bin/bash

VMNAME="archiveteam-warrior-2"
INSTALL_ISO="debian-6.0.5-i386-netinst.iso"

VBoxManage createvm --name $VMNAME --ostype Debian --register
VBoxManage modifyvm $VMNAME \
  --memory 400 \
  --vram 1 \
  --acpi on \
  --ioapic off \
  --cpus 1 \
  --rtcuseutc on \
  --cpuhotplug off \
  --pae off \
  --hwvirtex on \
  --hwvirtexexcl on \
  --nestedpaging on \
  --largepages off \
  --accelerate3d off \
  --nic1 nat \
  --nictype1 82540EM \
  --natpf1 "Web interface,tcp,127.0.0.1,8001,,8001" \
  --audio none \
  --clipboard disabled \
  --usb off \
  --usbehci off \
  --mouse ps2 \
  --keyboard ps2 \
  --biosbootmenu menuonly

VBoxManage storagectl $VMNAME --name "SATA Controller" --add sata
VBoxManage createhd --filename os.vdi --size 8192
VBoxManage createhd --filename data.vdi --size 61440
VBoxManage storageattach $VMNAME \
  --storagectl "SATA Controller" \
  --port 0 --device 0 --type hdd \
  --medium os.vdi
VBoxManage storageattach $VMNAME \
  --storagectl "SATA Controller" \
  --port 1 --device 0 --type hdd \
  --medium data.vdi

VBoxManage storagectl $VMNAME --name "IDE Controller" --add ide
VBoxManage storageattach $VMNAME --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium $INSTALL_ISO

