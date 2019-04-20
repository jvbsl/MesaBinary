git clone https://gitlab.freedesktop.org/mesa/mesa.git
cd mesa

mkdir ..\build\ 2> NUL
mkdir ..\build\x86 2> NUL
mkdir ..\build\x86_64 2> NUL

scons machine=x86_64 libgl-gdi

cp build\windows-x86_64-debug\gallium\targets\libgl-gdi\ ..\build\x86_64 2> NUL

scons machine=x86 libgl-gdi

cp build\windows-x86-debug\gallium\targets\libgl-gdi\ ..\build\x86 2> NUL


7z a ..\opengl_win.zip ..\build\