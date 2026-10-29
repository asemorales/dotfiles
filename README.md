# dotfiles

> "The identity, which we ascribe to the mind of man, is only a fictitious one. [...] man is nothing but a bundle or collection of different dotfiles."
>
> David Hume, *A Treatise of Human Nature* (1739)

## Components

- [Debian 12](https://www.debian.org) as Linux distribution
- [Xfce](https://www.xfce.org) as desktop environment
  - `bierstadt` and `bierstadt-dark` as window, GTK and notification themes
  - Icons recoloured from Suru++ Asprómauros
  - [Bibata Modern](https://github.com/ful1e5/Bibata_Cursor) cursor, recoloured by `themes/cursors/build.py`: cream in the dark room, ink in the light room
  - App colour preference set to dark in the dark room and light in the light room, so browsers and Electron apps set to use the system colour scheme match the room
  - Inter, DM Mono and Newsreader as fonts
  - Public-domain landscape paintings as wallpapers
  - [eww](https://github.com/elkowar/eww) as panel
  - [btop](https://github.com/aristocratos/btop) as resource monitor
- [Bash](https://www.gnu.org/software/bash/) as shell, with a two-line prompt and themed [fzf](https://github.com/junegunn/fzf)
- [Firefox](https://www.mozilla.org/firefox/) as browser, in Bierstadt colours with a painting on the new tab
- [VSCodium](https://vscodium.com) as text editor
- [Neovim](https://neovim.io) as terminal text editor
- [Kitty](https://sw.kovidgoyal.net/kitty/) as terminal, using the official build in `~/.local/kitty.app` because Debian's 0.26 cannot show Yazi's image previews
- [Yazi](https://yazi-rs.github.io) as file explorer

## Folders

| Folder | Links to | Contents |
| --- | --- | --- |
| `dot/` | `~/.<name>` | Shell startup files, `gitconfig`, `dmrc`, `ssh/config` |
| `config/` | `~/.config/<name>` | btop themes, eww, fish, git, GTK bookmarks, MIME defaults, Kitty, neofetch, Neovim, systemd user units, XDG folders, VSCodium, xfce4 terminal and helpers, Yazi |
| `firefox/` | `~/.mozilla/firefox/<profile>/<name>` | Bierstadt colours for Firefox (`user.js`, `chrome/userChrome.css`). `chrome/userContent.css` is a template that `bierstadt-mode` fills with a painting and writes into the profile |
| `thunderbird/` | `~/.thunderbird/<profile>/<name>` | Bierstadt colours and fonts for Thunderbird (`user.js`, `chrome/userChrome.css`, `chrome/userContent.css`) |
| `claude/` | `~/.claude/<name>` | Claude Code settings and skills |
| `themes/` | `~/.themes/<name>` | `bierstadt` and `bierstadt-dark` themes |
| `local/` | `~/.local/<name>` | `bierstadt-mode`, `bierstadt-caption`, `bierstadt-bar`, `bierstadt-greeter`, `bierstadt-grub`, `bierstadt-plymouth`, `bierstadt-root`, icon build script, Yazi launcher |

## Install

```bash
git clone <this repo> ~/code/dotfiles
~/code/dotfiles/INSTALL.sh
```

`INSTALL.sh` warns when a real file sits where a link should go. Compare the two files with `diff`, keep the version you want in the repo, delete the home copy, and run the script again.

## Setup

After `INSTALL.sh`, run `BIERSTADT.sh` inside an Xfce session. It fetches the fonts and paintings, builds the icon and cursor themes, and applies the Xfce settings for fonts, window shadows, workspaces, and the top panel.

Switch rooms with `bierstadt-mode dark`, `bierstadt-mode light` or `bierstadt-mode toggle`. Dark is the default.

Run `bierstadt-greeter` to theme the login screen in the current room. It asks for sudo because the login screen can only read system folders. Run it again after switching rooms.

Run `bierstadt-grub` to theme the boot menu. It builds a GRUB theme from the same painting and palette, installs it to `/boot/grub/themes/bierstadt`, and runs `update-grub`, so it also asks for sudo. It saves the original `/etc/default/grub` as `/etc/default/grub.pre-bierstadt`.

Run `bierstadt-plymouth` to theme the boot splash that appears between the two. The splash fades in the same painting and shows progress as a hairline, with no caption. The script installs a Plymouth theme, adds `splash` to the kernel command line, and rebuilds the initramfs, so it asks for sudo too.

Every time you run `bierstadt-mode`, it puts a different painting from the room on Firefox's new tab. Firefox shows it after its next restart.

To install Kitty's official build, run `curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n`, then link `~/.local/kitty.app/bin/kitty` and `kitten` into `~/.local/bin`. `dot/xsessionrc` puts `~/.local/bin` on the desktop's PATH so menus find Kitty.

## Add a new config

1. Move the file into the matching folder in this repo.
2. Add a `link_dot_path`, `link_config_path`, `link_claude_path` or `link_local_path` line to `INSTALL.sh`.
3. Run `INSTALL.sh`.

## Check the script

Use [ShellCheck](https://www.shellcheck.net) to find common bugs in the install script:

```bash
shellcheck INSTALL.sh
```

## Add local configs to untracked files

- `~/.gitconfig.local` for your git name and email
- `~/.ssh/config.local` for private SSH hosts

For example, `~/.gitconfig.local`:

```ini
[user]
	name = Your Name
	email = you@example.com
```

## Credits

Based on [vEnhance/dotfiles](https://github.com/vEnhance/dotfiles)
