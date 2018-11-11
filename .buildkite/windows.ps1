Set-PSDebug -Trace 1

$env:PATH="$env:PATH;D:\ghc\ghc-8.2.2\bin;D:\stack"

choco install msys2 -y

refreshenv

mintty.exe /bin/env MSYSTEM=MINGW64 /bin/bash -l build.sh
