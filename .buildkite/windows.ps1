Set-PSDebug -Trace 1

choco install msys2 -y
refreshenv

$env:PATH="D:\ghc\ghc-8.2.2\bin;C:\tools\msys64\usr\bin;\C:\tools\msys64\bin"

env.exe MSYSTEM=MINGW64 bash.exe -l (Get-Item -PATH ".\.buildkite\build.sh").FullName
