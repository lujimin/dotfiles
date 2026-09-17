lujimin 的 dotfiles，使用 [`chezmoi`](https://github.com/twpayne/chezmoi) 管理。

## macOS

### 前置条件

在 macOS 上应用这些 dotfiles 之前：

- 安装 [Homebrew](https://brew.sh/)，并确保可以在 `PATH` 中找到 `brew`。
- 安装 [Fish](https://fishshell.com/)，并将其设置为默认登录 Shell。本仓库不会安装 Fish，也不会修改默认 Shell。

### 安装

首先使用 Homebrew 手动安装 chezmoi：

```console
$ brew install chezmoi
```

然后初始化仓库并应用这些 dotfiles：

```console
$ chezmoi init --apply lujimin
```

## Arch Linux

### 前置条件

在 Arch Linux 上应用这些 dotfiles 之前：

- 使用日常登录的普通用户，并确保系统已安装 `sudo`，且该用户具有 sudo 权限。
- 为该用户设置可用的本机登录密码；安装软件和切换默认 Shell 时，按提示输入密码。
- 确保网络可访问 Arch 软件源、archlinuxcn 和 GitHub。

无需提前安装 Fish、paru 或桌面环境。

### 安装

首先在普通用户的终端中使用 pacman 安装 chezmoi 和 Git：

```console
$ sudo pacman -Syu --needed chezmoi git
```

然后以同一个普通用户初始化仓库并应用这些 dotfiles：

```console
$ chezmoi init --apply lujimin
```

不要在 `chezmoi` 命令前加 `sudo`，以确保配置写入当前用户的家目录；需要管理员权限的系统操作会由脚本自行调用 `sudo`。
完成后重新登录终端或 SSH 会话，使默认 Fish Shell 生效。

### 初始化行为

Arch 安装脚本仅匹配 `/etc/os-release` 中的 `ID=arch`，首次应用或脚本内容变化时执行。
脚本会检查 pacman 的有效配置；未启用 `archlinuxcn` 时，在 `/etc/pacman.conf` 末尾添加该仓库，使用 `https://repo.archlinuxcn.org/$arch`。已有配置（包括通过 `Include` 引入的配置）会保留，不重复添加。
首次安装 `archlinuxcn-keyring` 前，会本地签名信任 `farseerfc@archlinux.org` 的密钥；随后刷新数据库并安装密钥环，全程保留软件包签名校验。已安装密钥环时跳过此步骤，后续随系统升级更新。
密钥环安装成功后，脚本使用 `pacman -Syu --needed --noconfirm` 升级系统中已配置仓库的软件包，并安装清单中的软件包。

`paru` 和 `oh-my-pi` 直接通过 pacman 从 archlinuxcn 安装预编译包，并随系统升级更新，无需本机构建或提前安装 AUR helper。

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
