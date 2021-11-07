$BISONFLEX=Join-Path -Path (Get-Location) -ChildPath "winflexbison"
$ENV:Path += ";$BISONFLEX"

Set-Location -Path mesa

git clean -xdf

meson configure

meson builddir/ --buildtype=release --backend=vs

msbuild builddir/mesa.sln -m /p:Platform="Win32"

Copy-Item "builddir\src\gallium\targets\libgl-gdi\*" -Exclude "*@@*" -Destination ..\build\x86 -Recurse

Set-Location -Path ..