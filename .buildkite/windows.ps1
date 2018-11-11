Set-PSDebug -Trace 1

$env:PATH="$env:PATH;D:\ghc\ghc-8.2.2\bin;D:\stack"

choco install msys2 -y

refreshenv

C:\tools\msys64\usr\bin\mintty.exe --nodaemon - /bin/env MSYSTEM=MINGW64 /usr/bin/bash -l build.sh
