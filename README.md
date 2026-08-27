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
