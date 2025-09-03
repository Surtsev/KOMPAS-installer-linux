#!/bin/bash
# Создаём новый 64-битный префикс для KOMPAS-3D
export WINEPREFIX="$HOME/.var/app/com.usebottles.bottles/data/bottles/bottles/KOMPAS64"
export WINEARCH=win64

# Удаляем старый префикс (если есть)
rm -rf "$WINEPREFIX"

echo "[*] Создаём новый 64-битный Wine префикс..."
wineboot -u

echo "[*] Удаляем wine-mono..."
winetricks -q remove_mono

echo "[*] Ставим .NET Framework 4.7.2..."
winetricks -q dotnet472

echo "[*] Ставим системные библиотеки..."
winetricks -q ucrtbase2019 vcrun2019 gdiplus msxml6 riched20

echo "[*] Ставим шрифты..."
winetricks -q corefonts andale arial comicsans courier georgia impact times trebuchet verdana webdings

echo "[*] Ставим d3dcompiler_47..."
winetricks -q d3dcompiler_47

# Опционально — включить DXVK (для ускорения 3D)
echo "[*] Ставим пакеты для ускорения графики, обработки..."
winetricks -q dxvk d3dx9 d3dx11_43 d3dcompiler_43

echo "[*] Префикс готов! Теперь можно запускать установщик KOMPAS-3D:"
echo "WINEPREFIX=\"$WINEPREFIX\" wine ~/Downloads/KOMPAS-3D\\ v23\\ x64/Setup.exe"

