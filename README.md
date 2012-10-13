Warrior VM construction scripts (work in progress)
==================================================

The scripts in this repository can be used to build a new virtual machine of the ArchiveTeam Warrior 2.

<code>build-vm.sh</code> is a script that builds a new VirtualBox virtual machine

<code>warrior-preseed.cfg</code> is a Debian 6.0 (Squeeze) preseed configuration file

<code>pack-vm.sh</code> turns the virtual machine into a virtual appliance .ova


Building a warrior
------------------

Install VirtualBox and download the Debian netinst ISO: http://cdimage.debian.org/debian-cd/6.0.6/i386/iso-cd/debian-6.0.6-i386-netinst.iso

Step 1: Create a VM with the required properties by running this script:

    ./build-vm.sh

Step 2: Start the VM. It will start the Debian installer. To start the automated installation, press <code>Esc</code> and type:

    auto url=https://raw.github.com/ArchiveTeam/warrior-preseed/master/warrior-preseed.cfg hostname=warriorvm domain=archiveteam

(Replace that GitHub URL with a local HTTP URL. The Debian installer does not like HTTPS.)

Step 3: Wait for the installer to finish and shut down the VM.

Step 4: As an optional step, to minimise the disk size of your appliance, you can run a cleanup script that removes the log files, the APT cache and a few other large, unnecessary files. It will also zero-fill the unused space on the disk.

Start the VM and select the rescue mode from the grub menu. Log in with root password `archiveteam`. Then run

    /home/warrior/warrior-code2/cleanup.sh

and wait for the script to finish. (The zero-filling will end with a warning about disk space.) Then stop the VM

    shutdown -h now

Step 5: You can now turn the VM into a virtual appliance package:

    ./pack-vm.sh

