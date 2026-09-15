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
