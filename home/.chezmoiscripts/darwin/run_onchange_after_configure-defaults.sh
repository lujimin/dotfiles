#!/bin/zsh

# 任一命令或管道失败、引用未定义变量时立即退出，并禁止路径名通配展开
set -eufo pipefail

# 禁用双指左右轻扫的页面前进/后退手势（当前未启用）
# defaults write -g AppleEnableSwipeNavigateWithScrolls -int 0

# 禁用长按按键时弹出的重音字符选择菜单，使长按恢复为连续输入
defaults write -g ApplePressAndHoldEnabled -int 0

# 始终显示所有文件的扩展名
defaults write -g AppleShowAllExtensions -int 1

# 缩短按住按键后开始连续输入前的等待时间（当前未启用，数值越小越快）
# defaults write -g InitialKeyRepeat -int 15

# 加快按住按键时的连续输入速度（当前未启用，数值越小越快）
# defaults write -g KeyRepeat -int 2

# 禁用自动将句首字母转换为大写
defaults write -g NSAutomaticCapitalizationEnabled -int 0

# 禁用自动将连续连字符替换为智能破折号
defaults write -g NSAutomaticDashSubstitutionEnabled -int 0

# 禁用连按两次空格自动输入句号
defaults write -g NSAutomaticPeriodSubstitutionEnabled -int 0

# 禁用系统级自动拼写纠正
defaults write -g NSAutomaticSpellingCorrectionEnabled -int 0

# 禁用系统窗口打开和关闭时的动画（当前未启用）
# defaults write -g NSAutomaticWindowAnimationsEnabled -int 0

# 禁用使用 WebKit 的应用和网页输入框中的自动拼写纠正
defaults write -g WebAutomaticSpellingCorrectionEnabled -int 0

# 键盘快捷键 > 调度中心 > 显示通知中心（⌃⌥⌘N）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 163 \
    '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>110</integer><integer>45</integer><integer>1835008</integer></array><key>type</key><string>standard</string></dict></dict>'

# 键盘快捷键 > 调度中心 > 打开/关闭台前调度（⌃⌥⌘D）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 222 \
    '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>100</integer><integer>2</integer><integer>1835008</integer></array><key>type</key><string>standard</string></dict></dict>'

# 键盘快捷键 > 窗口 > 缩放（⌃⌥⌘F）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 235 \
    '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>102</integer><integer>3</integer><integer>1835008</integer></array><key>type</key><string>standard</string></dict></dict>'

# 键盘快捷键 > 窗口 > 四分排列（⌃⌥⌘S）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 256 \
    '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>115</integer><integer>1</integer><integer>1835008</integer></array><key>type</key><string>standard</string></dict></dict>'

# 键盘快捷键 > 窗口 > 全屏幕平铺到左侧/右侧（⌃⌥⌘←/→）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 257 \
    '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>65535</integer><integer>123</integer><integer>10223616</integer></array><key>type</key><string>standard</string></dict></dict>'
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 258 \
    '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>65535</integer><integer>124</integer><integer>10223616</integer></array><key>type</key><string>standard</string></dict></dict>'

# 重新加载当前用户的快捷键配置，使上述修改立即生效
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

# 自动隐藏和显示 Dock（当前未启用）
# defaults write com.apple.dock autohide -int 1

# 不在 Dock 中显示最近使用的应用（当前未启用）
# defaults write com.apple.dock show-recents -int 0

# 在 Finder 窗口标题栏中显示当前目录的完整 POSIX 路径
defaults write com.apple.finder _FXShowPosixPathInTitle -int 1

# 将 Finder 的默认显示方式设为列表视图
defaults write com.apple.finder FXPreferredViewStyle -string Nlsv

# Finder 按名称等条件排序时，将文件夹显示在文件之前
defaults write com.apple.finder _FXSortFoldersFirst -int 1
