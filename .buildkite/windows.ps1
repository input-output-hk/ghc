Set-PSDebug -Trace 1

$env:PATH="$env:PATH;D:\ghc\ghc-8.2.2\bin;D:\stack;C:\tools\msys64\usr\bin;\C:\tools\msys64\bin"

choco install msys2 -y

refreshenv

env.exe MSYSTEM=MINGW64 bash.exe -l ./build.sh
