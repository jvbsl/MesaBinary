git clone https://gitlab.freedesktop.org/mesa/mesa.git

New-Item -ItemType Directory -Force -Path build
New-Item -ItemType Directory -Force -Path build\x86
New-Item -ItemType Directory -Force -Path build\x86_64

Set-Location -Path mesa

$env:LLVM = "C:\Libraries\llvm-4.0.0"

scons machine=x86_64 llvm=yes libgl-gdi

Copy-Item "build\windows-x86_64-debug\gallium\targets\libgl-gdi\*" -Destination ..\build\x86_64 -Recurse

scons machine=x86 llvm=yes libgl-gdi

Copy-Item "build\windows-x86-debug\gallium\targets\libgl-gdi\*" -Destination ..\build\x86 -Recurse

Set-Location -Path ..
7z a opengl_win.zip build\
7z a opengl_win_dll.zip build\**\*.dll