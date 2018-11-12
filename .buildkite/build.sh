pacman -S --needed --noconfirm \
       curl git tar bsdtar binutils autoconf make xz \
       libtool automake python python2 p7zip patch \
       ca-certificates mingw-w64-$(uname -m)-gcc \
       mingw-w64-$(uname -m)-tools-git dos2unix

arch=x86_64 # or i386
bitness=64 # or 32

export PATH=$PATH:/d/ghc/ghc-8.4.3/bin:/d/usr/local/bin

# install ghc if not present
if [ ! -f /d/ghc/ghc-8.4.3/bin/ghc ]; then
    curl -L https://downloads.haskell.org/~ghc/8.4.3/ghc-8.4.3-${arch}-unknown-mingw32.tar.xz | tar -xJ -C /d/ghc
fi
mkdir -p /d/usr/local/bin
if [ ! -f /d/usr/local/bin/cabal ]; then
    curl -L https://www.haskell.org/cabal/release/cabal-install-2.2.0.0/cabal-install-2.2.0.0-${arch}-unknown-mingw32.zip | bsdtar -xzf- -C /d/usr/local/bin
fi
if [ ! -f /d/usr/local/bin/alex ]; then
    cabal update
    cabal install -j --prefix=/d/usr/local alex happy
fi

# make sure we are in the buildkite build checkout path
cd "${BUILDKITE_BUILD_CHECKOUT_PATH}"
# This file *must* have unix line endings; otherwise mk/get-win32-tarballs.sh will barf.
dos2unix mk/win32-tarballs.md5sum
# let's build!
./boot
./configure --silent --enable-tarballs-autodownload
make --silent -j4 V=0
make --silent V=0 binary-dist
