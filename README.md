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
脚本会检查 pacman 的有效配置；未启用 `archlinuxcn` 时，在 `/etc/pacman.conf` 末尾添加该仓库，使用 `https://repo.archlinuxcn.org/$arch`。已有配置（包括通过 `Include` 引入的配置）会保留，不重复添加。
首次安装 `archlinuxcn-keyring` 前，会本地签名信任 `farseerfc@archlinux.org` 的密钥；随后刷新数据库并安装密钥环，全程保留软件包签名校验。
密钥环安装成功后，脚本使用 `pacman -Syu --needed --noconfirm` 升级系统中已配置仓库的软件包，并安装清单中的软件包，无需提前手动运行系统升级。

请以拥有 sudo 权限的普通用户运行 chezmoi，构建软件包不支持直接使用 root。
脚本会安装 `base-devel` 和 `git`；如果尚未安装 `paru`，会自动从 AUR 获取构建文件，在临时目录中通过 `makepkg` 构建安装，并在退出时清理构建目录。
AUR 包统一使用 `paru` 安装，无需提前准备 AUR helper。
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
