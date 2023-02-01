#!/bin/bash
# 安装 rwfus
cd /tmp
git clone https://github.com/ValShaped/rwfus.git
cd rwfus
./rwfus -iI
cd /tmp
# 重新安裝 glibc
sudo pacman -S glibc --noconfirm
# 編輯 locale.gen
sudo sed -i "s%#zh_CN.UTF-8 UTF-8%zh_CN.UTF-8 UTF-8%" /etc/locale.gen
# 生成语言
sudo locale-gen
# 安裝程式: kde翻译组件、plasma
sudo pacman -S ki18n --noconfirm
sudo pacman -S plasma --noconfirm
# 重新安裝所有程式
sudo pacman -Qq > packages.txt
for pkgName in $(cat ./packages.txt)
do
  sudo pacman -S $pkgName --noconfirm
done
# 完成提示語
echo "汉化完成！请重新启动以应用修改！"