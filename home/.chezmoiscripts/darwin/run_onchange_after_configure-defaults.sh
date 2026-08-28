#!/bin/zsh

set -eufo pipefail

# defaults write -g AppleEnableSwipeNavigateWithScrolls -int 0
defaults write -g ApplePressAndHoldEnabled -int 0
defaults write -g AppleShowAllExtensions -int 1
# defaults write -g InitialKeyRepeat -int 15
# defaults write -g KeyRepeat -int 2
defaults write -g NSAutomaticCapitalizationEnabled -int 0
defaults write -g NSAutomaticDashSubstitutionEnabled -int 0
defaults write -g NSAutomaticPeriodSubstitutionEnabled -int 0
defaults write -g NSAutomaticSpellingCorrectionEnabled -int 0
# defaults write -g NSAutomaticWindowAnimationsEnabled -int 0
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

/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

# defaults write com.apple.dock autohide -int 1
# defaults write com.apple.dock show-recents -int 0

defaults write com.apple.finder _FXShowPosixPathInTitle -int 1
defaults write com.apple.finder FXPreferredViewStyle -string Nlsv
defaults write com.apple.finder _FXSortFoldersFirst -int 1
