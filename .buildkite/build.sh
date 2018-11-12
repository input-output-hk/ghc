pacman -S --needed --noconfirm \
       curl git tar bsdtar binutils autoconf make xz \
       libtool automake python python2 p7zip patch \
       ca-certificates mingw-w64-$(uname -m)-gcc \
       mingw-w64-$(uname -m)-tools-git

arch=x86_64 # or i386
bitness=64 # or 32

export PATH=$PATH:/mingw${bitness}/bin:/usr/local/bin

# install ghc if not present
if [ ! -f /mingw${bitness}/bin/ghc ]; then
    curl -L https://downloads.haskell.org/~ghc/8.4.3/ghc-8.4.3-${arch}-unknown-mingw32.tar.xz | tar -xJ -C /mingw${bitness} --strip-components=1
fi
mkdir -p /usr/local/bin
if [ ! -f /usr/local/bin/cabal ]; then
    curl -L https://www.haskell.org/cabal/release/cabal-install-2.2.0.0/cabal-install-2.2.0.0-${arch}-unknown-mingw32.zip | bsdtar -xzf- -C /usr/local/bin
fi
if [ ! -f /usr/local/bin/alex ]; then
    cabal update
    cabal install -j --prefix=/usr/local alex happy
fi

# make sure we are in the buildkite build checkout path
cd "${BUILDKITE_BUILD_CHECKOUT_PATH}"
# let's build!
./boot
./configure
make binary-dist -j4
