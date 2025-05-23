#1/bin/sh

echo "Builing kernel binary."

cd sys && make

cd ..

echo "Building disk image..."

#dd if=/dev/urandom of=dos.img bs=1M count=4096 status=progress

echo "Creating loop device..."

sudo losetup loop0 dos.img

echo "Creating GPT partition table..."

sudo sgdisk -Z /dev/loop0

echo "Creating partition"

sudo parted -s /dev/loop0 \	# < - need this command to work
	mkpart primary 0 512MB \
	mkpart primary 512M 4GB

echo "Formatting partition"

sudo mkfs.fat -F 32 /dev/loop0p1

echo "Mounting partitions..."

#sudo mount /dev/loop0p2 /mnt

echo "Adding kernel..."

#sudo cp sys/kernel.bin /mnt

echo "Installing GRUB..."

#sudo grub-install --target=x86_64-efi --efi-directory=/mnt/boot --bootloader-id=GRUB

echo "Configuring GRUB..."

#sudo grub-mkconfig -o /mnt/grub/grub.cfg

echo "Unmounting partitions"

#sudo umount /mnt

sudo losetup -d /dev/loop0

echo "Done."

