Set-PSDebug -Trace 1

$env:PATH="$env:PATH;D:\ghc\ghc-8.2.2\bin;D:\stack"

stack.exe exec --no-ghc-package-path mintty -- -w hide /bin/env MSYSTEM=MINGW64 /bin/bash -l build.sh
