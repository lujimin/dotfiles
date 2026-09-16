#!/bin/zsh

# 任一命令或管道失败、引用未定义变量时立即退出，并禁止路径名通配展开
set -eufo pipefail

# 禁用双指左右轻扫的页面前进/后退手势（当前未启用）
# defaults write -g AppleEnableSwipeNavigateWithScrolls -int 0

# 鼠标 > 跟踪速度 > 保存当前值（适用于妙控鼠标等鼠标设备）
defaults write -g com.apple.mouse.scaling -float 2.5

# 触控板 > 光标与点按 > 跟踪速度 > 保存当前值（适用于妙控板和内置触控板）
defaults write -g com.apple.trackpad.scaling -float 0.875

# 辅助功能 > 指针控制 > 触控板选项 > 将拖移样式设为“三指拖移”
# 同时配置内置和蓝牙触控板，并关闭其他拖移方式
for trackpad_domain in com.apple.AppleMultitouchTrackpad com.apple.driver.AppleBluetoothMultitouch.trackpad; do
    defaults write "$trackpad_domain" Dragging -bool false
    defaults write "$trackpad_domain" DragLock -bool false
    defaults write "$trackpad_domain" TrackpadThreeFingerDrag -bool true

    # 为三指拖移让出手势，将切换全屏应用和调度中心的轻扫手势设为四指
    defaults write "$trackpad_domain" TrackpadThreeFingerHorizSwipeGesture -int 0
    defaults write "$trackpad_domain" TrackpadThreeFingerVertSwipeGesture -int 0
    defaults write "$trackpad_domain" TrackpadFourFingerHorizSwipeGesture -int 2
    defaults write "$trackpad_domain" TrackpadFourFingerVertSwipeGesture -int 2
done

# 同步当前机器的全局偏好（ByHost）；只写设备配置会导致手势行为与设置界面不一致
defaults -currentHost write -g com.apple.trackpad.threeFingerDragGesture -bool true
defaults -currentHost write -g com.apple.trackpad.threeFingerHorizSwipeGesture -int 0
defaults -currentHost write -g com.apple.trackpad.threeFingerVertSwipeGesture -int 0
defaults -currentHost write -g com.apple.trackpad.fourFingerHorizSwipeGesture -int 2
defaults -currentHost write -g com.apple.trackpad.fourFingerVertSwipeGesture -int 2

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

# 桌面与程序坞 > 程序坞 > 启用图标放大效果，并将普通大小设为 50、放大后大小设为 70
defaults write com.apple.dock tilesize -int 50
defaults write com.apple.dock largesize -int 70
defaults write com.apple.dock magnification -bool true

# 桌面与程序坞 > 窗口 > 将窗口标题栏连按操作设为“填充”
defaults write -g AppleActionOnDoubleClick -string Fill

# 桌面与程序坞 > 窗口 > 启用平铺窗口边缘空白
defaults write com.apple.WindowManager EnableTiledWindowMargins -bool true

# 桌面与程序坞 > 调度中心 > 使窗口按应用程序成组
defaults write com.apple.dock expose-group-apps -bool true

# 键盘快捷键 > 调度中心 > 显示通知中心（⌃⌥N）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 163 \
    '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>110</integer><integer>45</integer><integer>786432</integer></array><key>type</key><string>standard</string></dict></dict>'

# 键盘快捷键 > 调度中心 > 打开/关闭台前调度（⌃⌥A）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 222 \
    '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>97</integer><integer>0</integer><integer>786432</integer></array><key>type</key><string>standard</string></dict></dict>'

# 键盘快捷键 > 调度中心 > 显示桌面（⌃⌥D）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 36 \
    '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>100</integer><integer>2</integer><integer>786432</integer></array><key>type</key><string>standard</string></dict></dict>'
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 37 \
    '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>100</integer><integer>2</integer><integer>917504</integer></array><key>type</key><string>standard</string></dict></dict>'

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

# 在所有偏好设置写入后，重新加载当前用户的快捷键配置
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
