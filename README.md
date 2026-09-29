lujimin 的 dotfiles，使用 [`chezmoi`](https://github.com/twpayne/chezmoi) 管理。

## macOS

### 前置条件

- 安装 [Homebrew](https://brew.sh/)，确保 `brew` 可用。
- 安装 Fish 并设为默认登录 Shell；本仓库不会代为设置。
- 将 `id_ed25519` 和 `id_ed25519.pub` 放在 iCloud Drive 的 `工作/ssh` 目录，并选择“保留下载”。本机 `~/.ssh` 已有对应文件时可跳过。
- 如需跳过部分应用，先设置下面的跳过列表，再初始化。

### 安装

```fish
brew install chezmoi
chezmoi init --apply lujimin
```

已有 SSH 密钥会保留；缺少备份导致初始化中断时，补齐文件后运行 `chezmoi apply`。更换密钥或修改口令后，需自行更新备份。

应用配置后新开一个 Fish 会话。

### 跳过部分应用（可选）

在目标机器的 Fish 中执行一次：

```fish
set -Ux HOMEBREW_BUNDLE_CASK_SKIP "swish thunder winbox"
```

包名按字母顺序排列，以空格分隔并放在同一对引号内。增删时修改完整列表，重新执行即可。

- 设置在本机持久生效，不同步到其他机器；需从 Fish 运行 chezmoi。
- 只影响 `brew bundle`，不卸载已有应用，也不影响普通 `brew install`、`brew upgrade`。
- 修改列表不会立即重跑安装脚本，下次脚本执行时生效。
- 跳过命令行软件时，使用 `HOMEBREW_BUNDLE_BREW_SKIP`。

```fish
# 查看列表
set --show HOMEBREW_BUNDLE_CASK_SKIP

# 取消设置
set -eU HOMEBREW_BUNDLE_CASK_SKIP
```

### 软件更新

使用 `brew upgrade` 更新，包括 `herdr`；不要运行 `herdr update`。

默认跳过自带更新的应用；需要一并更新时运行 `brew upgrade --greedy-auto-updates`。Homebrew 配置保存在 `~/.homebrew/brew.env`；若设置了 `XDG_CONFIG_HOME`，需另行调整配置路径。

## Arch Linux

### 前置条件

- 使用有 sudo 权限和可用登录密码的普通用户，按提示输入密码。
- 网络可访问 Arch 软件源、archlinuxcn、AUR 和 GitHub。
- 仅支持 Arch Linux；无需预装 Fish、paru 或桌面环境。

初始化会升级系统软件包、启用 archlinuxcn、将默认 Shell 改为 Fish，并将系统语言设为 `zh_CN.UTF-8`。

**初始化会关闭当前用户的 SSH 密码登录。请先完成下面的密钥登录验证，并保留现有 SSH 会话，直到初始化后再次验证成功。**

### 配置 SSH 登录

在 Mac 上执行，将 `用户名` 和 `服务器地址` 替换为实际值。Mac 需已有对应密钥，远端用户需已创建且能够登录。

```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub 用户名@服务器地址
```

在另一个终端验证密钥登录：

```bash
ssh -o PreferredAuthentications=publickey -o IdentitiesOnly=yes -i ~/.ssh/id_ed25519 用户名@服务器地址
```

非默认 SSH 端口需给两条命令都加上 `-p 端口号`。私钥设有口令时，按提示输入。

远端家目录、`~/.ssh` 和 `authorized_keys` 不得允许组或其他用户写入，所有者应为当前用户或 root。自定义 SSH 配置需确认使用 `~/.ssh/authorized_keys`，并加载 `/etc/ssh/sshd_config.d/*.conf`。

### 安装与更新

在服务器上以该普通用户执行：

```bash
sudo pacman -Syu --needed chezmoi git
chezmoi init --apply lujimin
```

不要给 `chezmoi` 加 `sudo`。完成后新建 SSH 会话，确认密钥登录成功，再关闭旧会话；重新登录后 Fish 和语言设置生效。

后续使用 `paru -Syu` 更新系统及 AUR 软件，包括 `herdr`；不要运行 `herdr update`。

## Fish 中的 eza 快捷命令

输入缩写后按空格或回车展开，可追加路径或参数。若名称已被其他命令、函数或缩写占用，则不覆盖。

| 命令 | 用途 |
| --- | --- |
| `el` | 普通列表，目录优先 |
| `ell` | 详细列表，包含表头 |
| `ela` | 详细列表，包含隐藏文件 |
| `elt` | 两层目录树 |
| `elg` | 详细列表，包含隐藏文件和 Git 状态 |
| `eld` | 仅列出目录，包含隐藏目录和详细信息 |
| `elf` | 仅列出文件，包含隐藏文件和详细信息 |

图标需要 Nerd Font 等兼容字体。详细列表显示所属组和 ISO 日期，目录末尾显示 `/`。

- 过滤目录树中被 Git 忽略的内容：`elt --git-ignore`。
- 显示三层目录树：`elt -L 3`。
