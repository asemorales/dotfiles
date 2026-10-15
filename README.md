# dotfiles

> "The identity, which we ascribe to the mind of man, is only a fictitious one. [...] man is nothing but a bundle or collection of different dotfiles."
>
> David Hume, *A Treatise of Human Nature* (1739)

## Setup

- [Debian 12](https://www.debian.org) as Linux distribution
- [Xfce](https://www.xfce.org) as desktop environment
  - Gallery and Gallery-Navy as window, GTK and notification themes
  - Icons: Recoloured from Suru++ Asprómauros
  - Cursor: [Bibata Modern](https://github.com/ful1e5/Bibata_Cursor) recoloured by `themes/cursors/build.py`, cream in the navy room and ink in the light room
  - App light/dark preference: dark in the navy room and light in the light room, so browsers and Electron apps set to follow the device match the room
  - Fonts: Inter, DM Mono and Newsreader as fonts
  - Wallpapers: Public-domain landscape paintings
  - Panel: [eww](https://github.com/elkowar/eww)
  - Resource monitor: [btop](https://github.com/aristocratos/btop)
- [Bash](https://www.gnu.org/software/bash/) as shell, with a quiet two-line prompt and themed [fzf](https://github.com/junegunn/fzf)
- [Firefox](https://www.mozilla.org/firefox/) as browser, in Gallery colours with a painting on the new tab
- [VSCodium](https://vscodium.com) as text editor
- [Neovim](https://neovim.io) as terminal text editor
- [Kitty](https://sw.kovidgoyal.net/kitty/) as terminal (the official build in `~/.local/kitty.app`, since Debian's 0.26 cannot show Yazi's image previews)
- [Yazi](https://yazi-rs.github.io) as file explorer

## Folders

| Folder | Links to | Contents |
| --- | --- | --- |
| `dot/` | `~/.<name>` | Shell startup files, `gitconfig`, `dmrc`, `ssh/config` |
| `config/` | `~/.config/<name>` | btop themes, eww, fish, git, GTK bookmarks, MIME defaults, Kitty, neofetch, Neovim, systemd user units, XDG folders, VSCodium, xfce4 terminal and helpers, Yazi |
| `firefox/` | `~/.mozilla/firefox/<profile>/<name>` | Gallery colours for Firefox (`user.js`, `chrome/userChrome.css`). `chrome/userContent.css` is a template that `gallery-mode` fills with a painting and writes into the profile |
| `thunderbird/` | `~/.thunderbird/<profile>/<name>` | Gallery colours and fonts for Thunderbird (`user.js`, `chrome/userChrome.css`, `chrome/userContent.css`) |
| `claude/` | `~/.claude/<name>` | Claude Code settings and skills |
| `themes/` | `~/.themes/<name>` | Gallery and Gallery-Navy themes |
| `local/` | `~/.local/<name>` | `gallery-mode`, `gallery-caption`, `gallery-bar`, `gallery-greeter`, `gallery-grub`, `gallery-plymouth`, `gallery-root`, icon build script, Yazi launcher |

## Install

```bash
git clone <this repo> ~/code/dotfiles
~/code/dotfiles/INSTALL.sh
```

To fix warnings, compare the two files with `diff`. Keep the version you want in the repo, then delete the home copy and run the script again.

## Setup

After `INSTALL.sh`, run `GALLERY.sh` inside an Xfce session. This fetches the fonts and paintings, builds the icon themes, and applies Xfce settings in xfconf (fonts, window shadows, workspaces, the top panel).

Switch themes via terminal with `gallery-mode navy`, `gallery-mode light` or `gallery-mode toggle`. Navy is the default.

To dress the login screen in the current room, run `gallery-greeter`. It asks for sudo, because the login screen can only read system folders. Run it again after switching rooms.

To dress the boot menu to match, run `gallery-grub`. It builds a GRUB theme from the same painting and palette, installs it to `/boot/grub/themes/gallery` and runs `update-grub`, so it also asks for sudo. The first `/etc/default/grub` is kept as `/etc/default/grub.pre-gallery`.

To dress the boot splash between the two, run `gallery-plymouth`. It shows the same painting, fading in, with a hairline for progress and no caption. It installs a Plymouth theme, adds `splash` to the kernel command line and rebuilds the initramfs, so it asks for sudo too.

Firefox's new tab shows a different painting from the room each time `gallery-mode` runs. Firefox picks it up on its next start.

To get Kitty's official build, run `curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n`, then link `~/.local/kitty.app/bin/kitty` and `kitten` into `~/.local/bin`. `dot/xsessionrc` puts `~/.local/bin` on the desktop's PATH so menus find it.

## Add a new config

1. Move the file into the matching folder in this repo.
2. Add a `link_dot_path`, `link_config_path`, `link_claude_path` or `link_local_path` line to `INSTALL.sh`.
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
