Set-PSDebug -Trace 1

# More space on D:
$env:TMP="D:\\tmp"

chcp 65001

$env:PATH="D:\ghc\ghc-8.2.2\bin;D:\tools\msys64\usr\bin;\D:\tools\msys64\bin"

env.exe MSYSTEM=MINGW64 bash.exe -l (Get-Item -PATH ".\.buildkite\build.sh").FullName
