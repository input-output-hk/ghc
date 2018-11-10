Set-PSDebug -Trace 1

$env:PATH="$env:PATH;D:\ghc\ghc-8.2.2\bin;D:\stack"

boot

configure

make binary-dist
