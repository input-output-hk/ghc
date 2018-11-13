Set-PSDebug -Trace 1

# More space on D:
$env:TMP="D:\\tmp"

chcp 65001

$env:PATH="D:\ghc\ghc-8.2.2\bin;D:\tools\msys64\usr\bin;\D:\tools\msys64\bin"

# from here onwards, errors terminate the script
$ErrorActionPreference = "Stop"

env.exe MSYSTEM=MINGW64 bash.exe -l (Get-Item -PATH ".\.buildkite\build.sh").FullName

buildkite-agent artifact upload ghc.tar.xz
