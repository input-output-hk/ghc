echo "here we go!"
pacman -S --needed tar bsdtar binutils autoconf make xz \
                   libtool automake python python2 p7zip patch

./boot
./configure
make binary-dist
