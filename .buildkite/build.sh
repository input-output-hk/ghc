echo "here we go!"
pacman -S --needed --noconfirm \
       tar bsdtar binutils autoconf make xz \
       libtool automake python python2 p7zip patch

# make sure we are in the buildkite build checkout path
cd "${BUILDKITE_BUILD_CHECKOUT_PATH}"
# let's build!
./boot
./configure
make binary-dist -j4
