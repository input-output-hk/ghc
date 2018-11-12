Set-PSDebug -Trace 1

(Get-Item -PATH ".\.buildkite\build.sh").FullName

choco install msys2 -y

refreshenv

$env:Path.split(';')
(Get-Item -Path ".\").FullName

$env:PATH="D:\ghc\ghc-8.2.2\bin;C:\tools\msys64\usr\bin;\C:\tools\msys64\bin"

env.exe MSYSTEM=MINGW64 bash.exe -l (Get-Item -PATH ".\.buildkite\build.sh").FullName
