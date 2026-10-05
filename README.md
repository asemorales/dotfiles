# dotfiles

> "The identity, which we ascribe to the mind of man, is only a fictitious one. [...] man is nothing but a bundle or collection of different dotfiles."
>
> David Hume, *A Treatise of Human Nature* (1739)

## Setup

- [Debian 12](https://www.debian.org) as Linux distribution
- [Xfce](https://www.xfce.org) as desktop environment
  - RedishMidnight as window and GTK theme
  - Suru++ Asprómauros as icon theme
- [Bash](https://www.gnu.org/software/bash/) as shell
- [VSCodium](https://vscodium.com) as text editor
  - Tokyo Night as color theme
- [Xfce Terminal](https://docs.xfce.org/apps/xfce4-terminal/start) as terminal

## Folders

| Folder | Links to | Contents |
| --- | --- | --- |
| `dot/` | `~/.<name>` | Shell startup files, `gitconfig`, `dmrc`, `ssh/config` |
| `config/` | `~/.config/<name>` | fish, git, GTK bookmarks, MIME defaults, neofetch, systemd user units, XDG folders, VSCodium, xfce4 terminal |
| `claude/` | `~/.claude/<name>` | Claude Code settings and skills |

## Install

```bash
git clone <this repo> ~/code/dotfiles
~/code/dotfiles/INSTALL.sh
```

To fix warnings, compare the two files with `diff`. Keep the version you want in the repo, then delete the home copy and run the script again.

## Add a new config

1. Move the file into the matching folder in this repo.
2. Add a `link_dot_path`, `link_config_path`, or `link_claude_path` line to `INSTALL.sh`.
3. Run `INSTALL.sh`.

## Check the script

[ShellCheck](https://www.shellcheck.net) is used to find common bugs in shell scripts.

To run:
```bash
shellcheck INSTALL.sh
```

## Add local configs to untracked files

- `~/.gitconfig.local` to add git name and email
- `~/.ssh/config.local` to add private SSH hosts

For example:

```ini
[user]
	name = Your Name
	email = you@example.com
```

## Credits

Based on [vEnhance/dotfiles](https://github.com/vEnhance/dotfiles)
