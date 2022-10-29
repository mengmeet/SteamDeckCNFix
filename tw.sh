#!/bin/bash
# 停用 唯讀模式
sudo steamos-readonly disable
# 初始化 Pacman Keys
sudo pacman-key --init
sudo pacman-key --populate archlinux
# 重新安裝 glibc
sudo pacman -S glibc
# 編輯 locale.gen
sudo sed -i "s%#zh_TW.UTF-8 UTF-8%zh_TW.UTF-8 UTF-8%" /etc/locale.gen
# 生成語言
sudo locale-gen  
# 重新安裝常用程式: kde翻譯套件、plasma、檔案總管、程式商店、Kwrite、Konsole、系統設定、解壓縮程式、音效管理、截圖工具
sudo pacman -S ki18n plasma dolphin discover kwrite konsole systemsettings ark pavucontrol spectacle
# 復原唯讀模式
sudo steamos-readonly enable
# 完成提示語
echo "完成！請重新開機套用修改！"