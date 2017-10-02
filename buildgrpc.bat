@echo off
REM Set paths
REM First:
REM Install CMake.
REM Install Active State Perl (choco install activeperl)
REM Install Ninja (choco install ninja)
REM Install Go (choco install golang)
REM Install yasm and add it to PATH (choco install yasm)
REM Install Git
REM Then:
REM clone https://github.com/grpc/grpc.git to GRPCPATH (and set GRPCPATH below)
set GRPCPATH=D:\Projects\grpc
set GITPATH=C:\Program Files\Git
set GITPATHSRESOLVED=%GITPATH%\bin;%GITPATH%\mingw64\bin
set CMAKEPATH=d:\Downloads\cmake-3.9.1-win64-x64\cmake-3.9.1-win64-x64
set CMAKEPATHRESOLVED=%CMAKEPATH%\bin
set PATH=%PATH%;%GITPATHSRESOLVED%;%CMAKEPATHRESOLVED%
REM VERIFY PATHS
echo %PATH%
REM Set build folder
cd %GRPCPATH%
md .build
cd .build
REM Set build environment
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\Tools\VsDevCmd.bat"
REM Build using Ninja
cmake .. -GNinja -DCMAKE_BUILD_TYPE=Release
cmake --build .