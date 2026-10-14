# dotfiles

> "The identity, which we ascribe to the mind of man, is only a fictitious one. [...] man is nothing but a bundle or collection of different dotfiles."
>
> David Hume, *A Treatise of Human Nature* (1739)

## Setup

- [Debian 12](https://www.debian.org) as Linux distribution
- [Xfce](https://www.xfce.org) as desktop environment
  - Gallery and Gallery-Navy as window, GTK and notification themes, styled after [asemorales.github.io](https://asemorales.github.io)
  - Gallery icons, recoloured from Suru++ Asprómauros
  - Inter, DM Mono and Newsreader as fonts
  - Public-domain landscape paintings as wallpapers, one per workspace, with a Conky caption
- [Bash](https://www.gnu.org/software/bash/) as shell
- [VSCodium](https://vscodium.com) as text editor
  - Tokyo Night as color theme
- [Neovim](https://neovim.io) as terminal text editor
  - Gallery as color theme (`config/nvim/colors/gallery.lua`), following `gallery-mode`
- [Kitty](https://sw.kovidgoyal.net/kitty/) as terminal, with the Gallery colours and padding
- [Xfce Terminal](https://docs.xfce.org/apps/xfce4-terminal/start) as backup terminal

## Folders

| Folder | Links to | Contents |
| --- | --- | --- |
| `dot/` | `~/.<name>` | Shell startup files, `gitconfig`, `dmrc`, `ssh/config` |
| `config/` | `~/.config/<name>` | fish, git, GTK bookmarks, MIME defaults, Kitty, neofetch, Neovim, systemd user units, XDG folders, VSCodium, xfce4 terminal |
| `claude/` | `~/.claude/<name>` | Claude Code settings and skills |
| `themes/` | `~/.themes/<name>` | Gallery and Gallery-Navy themes |
| `local/` | `~/.local/<name>` | `gallery-mode`, `gallery-caption`, the icon build script |

## Install

```bash
git clone <this repo> ~/code/dotfiles
~/code/dotfiles/INSTALL.sh
```

To fix warnings, compare the two files with `diff`. Keep the version you want in the repo, then delete the home copy and run the script again.

## Gallery desktop

After `INSTALL.sh`, run `GALLERY.sh` once inside an Xfce session. It fetches the fonts and paintings, builds the icon themes, and applies the Xfce settings that live in xfconf rather than in files (fonts, window shadows, workspaces, the top panel).

Switch rooms with `gallery-mode navy`, `gallery-mode light` or `gallery-mode toggle`. Navy is the default.

- Colours: `themes/Gallery/gtk-3.0/_palette.css`. After a change, run `python3 -I ~/.themes/Gallery/build.py && python3 -I ~/.themes/Gallery/xfwm4-build.py`.
- Paintings, crops and captions: `config/gallery/wall.yml`. After a change, run `gallery-mode data`.

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
