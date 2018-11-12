echo "here we go!"
pacman -S --needed --noconfirm \
       curl git tar bsdtar binutils autoconf make xz \
       libtool automake python python2 p7zip patch \
       ca-certificates mingw-w64-$(uname -m)-gcc \
       mingw-w64-$(uname -m)-tools-git

# make sure we are in the buildkite build checkout path
cd "${BUILDKITE_BUILD_CHECKOUT_PATH}"
# let's build!
./boot
./configure
make binary-dist -j4
