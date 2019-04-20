git clone https://gitlab.freedesktop.org/mesa/mesa.git

New-Item -ItemType Directory -Force -Path build
New-Item -ItemType Directory -Force -Path build\x86
New-Item -ItemType Directory -Force -Path build\x86_64

Set-Location -Path mesa


scons machine=x86_64 libgl-gdi

Copy-Item "build\windows-x86_64-debug\gallium\targets\libgl-gdi\*" -Destination ..\build\x86_64 -Recurse

scons machine=x86 libgl-gdi

Copy-Item "build\windows-x86-debug\gallium\targets\libgl-gdi\*" -Destination ..\build\x86 -Recurse

Set-Location -Path ..
7z a opengl_win.zip build\