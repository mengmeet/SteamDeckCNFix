#!/bin/bash

# 检查是否以管理员身份运行
if [ "$(id -u)" != "0" ]; then
    echo "脚本需要以管理员身份运行！"

    # 使用sudo重新运行脚本
    sudo "$0" "$@"
    exit $?
fi

# 安装 rwfus
cd /tmp
git clone https://github.com/ValShaped/rwfus.git
cd rwfus
./rwfus -iI || { echo -e "\033[0;31mrwfus未能正常安装，退出脚本！\033[0m"; exit 1; }
cd /tmp
# 重新安裝 glibc
pacman -S glibc --noconfirm
# 編輯 locale.gen
sed -i "s%#zh_CN.UTF-8 UTF-8%zh_CN.UTF-8 UTF-8%" /etc/locale.gen
# 生成语言
locale-gen  zh_CN zh_CN.UTF-8 zh_TW.UTF-8 ja_JP.UTF-8 en_US.UTF-8
# 安裝程式: kde翻译组件、plasma
pacman -S ki18n --noconfirm
pacman -S plasma --noconfirm
# 重新安裝所有程式
pacman -Qq > packages.txt
for pkgName in $(cat ./packages.txt)
do
  # 获取软件包的版本号
  version=$(pacman -Q "$pkgName" | awk '{print $2}')

  # 重新安装指定版本的软件包
  pacman -S "$pkgName=$version" --noconfirm
done
# 安全fcitx5输入法
sudo pacman -Sy fcitx5 fcitx5-rime --noconfirm
# 完成提示語
echo "汉化完成！请重新启动以应用修改！"
