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
# 安裝: kde 的翻譯套件
sudo pacman -S ki18n
# 安裝: plasma
sudo pacman -S plasma
# 重新安裝: 檔案總管
sudo pacman -S dolphin
# 重新安裝: 程式商店
sudo pacman -S discover
# 重新安裝: Kwrite
sudo pacman -S kwrite
# 重新安裝: Konsole
sudo pacman -S konsole
# 重新安裝: 系統設定
sudo pacman -S systemsettings
# 重新安裝: Ark
sudo pacman -S ark
# 重新安裝: 音效管理
sudo pacman -S pavucontrol
# 重新安裝：截圖工具
sudo pacman -S spectacle
# 復原唯讀模式
sudo steamos-readonly enable
# 完成提示語
echo "完成！請重新開機套用修改！"