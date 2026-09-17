lujimin 的 dotfiles，使用 [`chezmoi`](https://github.com/twpayne/chezmoi) 管理。

## 前置条件

在 macOS 上应用这些 dotfiles 之前：

- 安装 [Homebrew](https://brew.sh/)，并确保可以在 `PATH` 中找到 `brew`。
- 安装 [Fish](https://fishshell.com/)，并将其设置为默认登录 Shell。本仓库不会安装 Fish，也不会修改默认 Shell。

## 安装

首先使用 Homebrew 手动安装 chezmoi：

```console
$ brew install chezmoi
```

然后初始化仓库并应用这些 dotfiles：

```console
$ chezmoi init --apply lujimin
```

## Arch Linux

Arch 安装脚本仅匹配 `/etc/os-release` 中的 `ID=arch`，首次应用或脚本内容变化时执行。
脚本使用 `pacman -Syu --needed --noconfirm` 刷新软件包数据库、升级系统中官方仓库的软件包，并安装清单中的软件包，无需提前手动运行系统升级。

AUR 包使用已安装的 `paru`，没有时使用 `yay`。请以拥有 sudo 权限的普通用户运行 chezmoi，并提前准备好 AUR helper 和构建环境。
如果 AUR 包尚未安装且找不到 helper，脚本会在安装任何包之前报错，不会静默跳过。
已经安装的 AUR 包不在本脚本中自动更新；请通过日常系统维护更新。

Arch 安装清单包含 `fish`，配置应用后会通过 `command -v fish` 查找路径并将其设为默认 Shell，无需提前手动安装 Fish。

## Fish 中的 eza 快捷命令

参考 [eza.fish 社区配置](https://github.com/imroc/eza.fish)的常见视图组合，使用 `e` 前缀避免占用 Fish 的 `la`、`ll` 及 `ls`、`tree` 等工具名称。
这些快捷命令使用 Fish `abbr`：输入后按空格或回车展开，可继续追加路径或参数，仅用于交互输入。
仅在已安装 eza 且名称未被现有命令、函数或缩写占用时注册。

| 快捷命令 | 用途 |
| --- | --- |
| `el` | 普通列表，目录优先 |
| `ell` | 详细列表，包含表头 |
| `ela` | 详细列表，包含隐藏文件 |
| `elt` | 两层目录树 |
| `elg` | 详细列表，包含隐藏文件和 Git 状态 |
| `eld` | 仅列出目录，显示详细信息 |
| `elf` | 仅列出文件，显示详细信息 |

所有视图使用 `--icons=auto`；图标显示需要终端字体包含对应字形，例如 Nerd Font。
目录树默认保留 Git 忽略的内容，需要过滤时使用 `elt --git-ignore`，修改深度可使用 `elt --level=3`。

应用配置后新开一个 Fish 会话即可使用。
