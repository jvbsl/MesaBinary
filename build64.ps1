$BISONFLEX=Join-Path -Path (Get-Location) -ChildPath "winflexbison"
$LLVM=Join-Path -Path (Get-Location) -ChildPath "llvm/tools/llvm"
$ENV:Path += ";$BISONFLEX;$LLVM"

Invoke-WebRequest "https://github.com/jvbsl/llvm-win-bin/releases/download/12.0.1/llvm_x64-windows-static.zip" -Destination "llvm.zip"

7z x "llvm.zip"

Set-Location -Path mesa

git clean -xdf

meson configure

meson builddir/ -D gallium-drivers=swrast --buildtype=release --backend=vs

msbuild builddir/mesa.sln -m

Copy-Item "builddir\src\gallium\targets\libgl-gdi\*" -Exclude "*@@*" -Destination ..\build\x86_64 -Recurse

Set-Location -Path ..