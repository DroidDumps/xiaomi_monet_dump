#!/bin/bash

cat boot.img.* 2>/dev/null >> boot.img
rm -f boot.img.* 2>/dev/null
cat system_ext/priv-app/Settings/Settings.apk.* 2>/dev/null >> system_ext/priv-app/Settings/Settings.apk
rm -f system_ext/priv-app/Settings/Settings.apk.* 2>/dev/null
cat bootimg/05_dtbdump_Bv3mMR\RW.dtb.* 2>/dev/null >> bootimg/05_dtbdump_Bv3mMR\RW.dtb
rm -f bootimg/05_dtbdump_Bv3mMR\RW.dtb.* 2>/dev/null
cat bootRE/boot.elf.* 2>/dev/null >> bootRE/boot.elf
rm -f bootRE/boot.elf.* 2>/dev/null
cat product/app/Maps/Maps.apk.* 2>/dev/null >> product/app/Maps/Maps.apk
rm -f product/app/Maps/Maps.apk.* 2>/dev/null
cat product/app/LatinImeGoogle/LatinImeGoogle.apk.* 2>/dev/null >> product/app/LatinImeGoogle/LatinImeGoogle.apk
rm -f product/app/LatinImeGoogle/LatinImeGoogle.apk.* 2>/dev/null
cat product/app/YouTube/YouTube.apk.* 2>/dev/null >> product/app/YouTube/YouTube.apk
rm -f product/app/YouTube/YouTube.apk.* 2>/dev/null
cat product/app/WebViewGoogle/WebViewGoogle.apk.* 2>/dev/null >> product/app/WebViewGoogle/WebViewGoogle.apk
rm -f product/app/WebViewGoogle/WebViewGoogle.apk.* 2>/dev/null
cat product/priv-app/Velvet/Velvet.apk.* 2>/dev/null >> product/priv-app/Velvet/Velvet.apk
rm -f product/priv-app/Velvet/Velvet.apk.* 2>/dev/null
cat product/priv-app/GmsCore/GmsCore.apk.* 2>/dev/null >> product/priv-app/GmsCore/GmsCore.apk
rm -f product/priv-app/GmsCore/GmsCore.apk.* 2>/dev/null
cat vendor/camera/mimoji/model2.zip.* 2>/dev/null >> vendor/camera/mimoji/model2.zip
rm -f vendor/camera/mimoji/model2.zip.* 2>/dev/null
cat system/system/apex/com.android.art.release.apex.* 2>/dev/null >> system/system/apex/com.android.art.release.apex
rm -f system/system/apex/com.android.art.release.apex.* 2>/dev/null
cat system/system/apex/com.android.vndk.current.apex.* 2>/dev/null >> system/system/apex/com.android.vndk.current.apex
rm -f system/system/apex/com.android.vndk.current.apex.* 2>/dev/null
cat system/system/app/MiuiWallpaper/MiuiWallpaper.apk.* 2>/dev/null >> system/system/app/MiuiWallpaper/MiuiWallpaper.apk
rm -f system/system/app/MiuiWallpaper/MiuiWallpaper.apk.* 2>/dev/null
cat system/system/app/MiuiVideoPlayer/MiuiVideoPlayer.apk.* 2>/dev/null >> system/system/app/MiuiVideoPlayer/MiuiVideoPlayer.apk
rm -f system/system/app/MiuiVideoPlayer/MiuiVideoPlayer.apk.* 2>/dev/null
cat system/system/priv-app/MiBrowserGlobal/MiBrowserGlobal.apk.* 2>/dev/null >> system/system/priv-app/MiBrowserGlobal/MiBrowserGlobal.apk
rm -f system/system/priv-app/MiBrowserGlobal/MiBrowserGlobal.apk.* 2>/dev/null
cat system/system/priv-app/MiuiCamera/MiuiCamera.apk.* 2>/dev/null >> system/system/priv-app/MiuiCamera/MiuiCamera.apk
rm -f system/system/priv-app/MiuiCamera/MiuiCamera.apk.* 2>/dev/null
